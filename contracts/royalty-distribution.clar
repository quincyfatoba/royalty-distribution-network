;; Royalty Distribution Contract

(define-constant CONTRACT-OWNER tx-sender)
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-NOT-FOUND (err u101))
(define-constant ERR-INVALID-SPLIT (err u102))

(define-data-var work-counter uint u0)

(define-map works
  { work-id: uint }
  {
    creator: principal,
    title: (string-ascii 100),
    created-at: uint,
    total-revenue: uint
  }
)

(define-map royalty-splits
  { work-id: uint, beneficiary: principal }
  {
    percentage: uint,
    earned: uint
  }
)

(define-map work-splits-count
  { work-id: uint }
  { count: uint }
)

;; Register work
(define-public (register-work (title (string-ascii 100)))
  (let ((new-id (+ (var-get work-counter) u1)))
    (var-set work-counter new-id)
    (map-set works
      { work-id: new-id }
      {
        creator: tx-sender,
        title: title,
        created-at: block-height,
        total-revenue: u0
      }
    )
    (ok new-id)
  )
)

;; Add beneficiary
(define-public (add-beneficiary
    (work-id uint)
    (beneficiary principal)
    (percentage uint)
  )
  (let
    (
      (work (unwrap! (map-get? works { work-id: work-id }) ERR-NOT-FOUND))
      (count (default-to u0 (get count (map-get? work-splits-count { work-id: work-id }))))
    )
    (asserts! (is-eq tx-sender (get creator work)) ERR-NOT-AUTHORIZED)
    (asserts! (<= percentage u100) ERR-INVALID-SPLIT)
    (map-set royalty-splits
      { work-id: work-id, beneficiary: beneficiary }
      { percentage: percentage, earned: u0 }
    )
    (map-set work-splits-count
      { work-id: work-id }
      { count: (+ count u1) }
    )
    (ok true)
  )
)

;; Distribute royalties
(define-public (distribute-royalties (work-id uint) (amount uint))
  (let ((work (unwrap! (map-get? works { work-id: work-id }) ERR-NOT-FOUND)))
    (map-set works
      { work-id: work-id }
      (merge work { total-revenue: (+ (get total-revenue work) amount) })
    )
    (ok true)
  )
)

;; Claim earnings
(define-public (claim-earnings (work-id uint))
  (let
    (
      (split (unwrap! (map-get? royalty-splits { work-id: work-id, beneficiary: tx-sender }) ERR-NOT-FOUND))
      (work (unwrap! (map-get? works { work-id: work-id }) ERR-NOT-FOUND))
      (earnings (/ (* (get total-revenue work) (get percentage split)) u100))
      (unclaimed (- earnings (get earned split)))
    )
    (map-set royalty-splits
      { work-id: work-id, beneficiary: tx-sender }
      (merge split { earned: earnings })
    )
    (ok unclaimed)
  )
)

(define-read-only (get-work (work-id uint))
  (map-get? works { work-id: work-id })
)

(define-read-only (get-split (work-id uint) (beneficiary principal))
  (map-get? royalty-splits { work-id: work-id, beneficiary: beneficiary })
)

(define-read-only (get-stats)
  (ok { total-works: (var-get work-counter) })
)
