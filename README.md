# Royalty Distribution Network

## Overview

The Royalty Distribution Network is a blockchain-based system that automates royalty payments to artists and creators whenever their work is used or sold. This smart contract solution eliminates intermediaries and ensures transparent, immediate distribution of payments to all contributors.

## Problem Statement

The music and creative industries face significant challenges with royalty distribution:
- **Industry Size**: Music industry worth $12B+ annually
- **Intermediary Costs**: 45% of revenue goes to intermediaries instead of artists
- **Payment Delays**: Traditional royalty payments can take 6+ months
- **Lack of Transparency**: Artists cannot easily track usage of their work
- **Complex Split Calculations**: Multiple contributors make manual distribution error-prone

## Solution

This smart contract platform enables:
- **Automatic Distribution**: Royalties distributed instantly when content is used
- **Transparent Tracking**: All transactions recorded immutably on blockchain
- **Fair Splits**: Pre-defined ownership percentages ensure accurate distribution
- **Direct Payments**: Eliminates intermediaries, maximizing creator earnings
- **Usage Tracking**: Real-time monitoring of content usage across platforms

## Real-Life Application

When songs stream on platforms, licenses are issued, or content is sold, smart contracts automatically calculate and distribute royalties to all contributors based on their ownership stakes. This applies to:
- Music streaming and downloads
- Sample usage in new productions
- Synchronization licensing for films/TV
- Physical and digital sales
- Live performance royalties

## Smart Contracts

### royalty-distribution

Records ownership stakes, tracks usage across platforms, and automatically distributes royalties to all beneficiaries.

**Key Features**:
- Register creative works with multiple contributors
- Define ownership percentages for each contributor
- Record usage events and calculate payments
- Distribute royalties proportionally
- Track payment history and balances
- Support for multiple payment currencies

## Technology Stack

- **Blockchain**: Stacks blockchain with Bitcoin finality
- **Smart Contract Language**: Clarity
- **Development Framework**: Clarinet

## Benefits

1. **For Artists**:
   - Receive payments instantly
   - Full transparency of earnings
   - Reduced intermediary fees
   - Accurate split calculations

2. **For Platforms**:
   - Automated compliance
   - Reduced administrative overhead
   - Transparent audit trails
   - Lower operational costs

3. **For Industry**:
   - Increased trust and efficiency
   - Reduced disputes over payments
   - Better data on content usage
   - Faster market growth

## Getting Started

### Prerequisites

- Clarinet installed
- Stacks wallet
- Node.js and npm

### Installation

```bash
# Clone the repository
git clone https://github.com/quincyfatoba/royalty-distribution-network.git

# Navigate to project directory
cd royalty-distribution-network

# Install dependencies
npm install

# Check contract syntax
clarinet check
```

### Testing

```bash
# Run all tests
npm test

# Run specific contract tests
clarinet test
```

## Usage Example

1. **Register a Creative Work**:
   - Artist registers song with contributor splits
   - Define percentages: Lead artist 40%, Producer 30%, Songwriter 30%

2. **Track Usage**:
   - Platform reports streaming/usage event
   - Smart contract records transaction

3. **Distribute Royalties**:
   - Contract calculates individual shares
   - Payments automatically sent to all contributors
   - Transaction recorded on blockchain

## Market Impact

- **Addressable Market**: $12B+ music industry + other creative sectors
- **Cost Savings**: Reduce intermediary fees from 45% to <5%
- **Time Savings**: Instant payments vs. 6+ month delays
- **Global Reach**: Cross-border payments without friction

## Future Enhancements

- Integration with major streaming platforms
- Support for complex licensing agreements
- Analytics dashboard for artists
- Multi-chain compatibility
- DAO governance for platform decisions

## Contributing

Contributions are welcome! Please read our contributing guidelines before submitting pull requests.

## License

MIT License - See LICENSE file for details

## Contact

For questions or support, please open an issue on GitHub.

## Acknowledgments

Built with Clarinet and the Stacks blockchain ecosystem.
