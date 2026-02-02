# Health Decoder

A service to help patients utilize healthcare by providing self-diagnostic tools, health logs, and insurance cost calculators.

> **Note**: This application was built in 2017-2018 using Rails 5.1.4 and Ruby 2.4.1. See [SECURITY.md](SECURITY.md) for important security information.

## Table of Contents

- [Motivation](#motivation)
- [Key Features](#key-features)
- [Technology Stack](#technology-stack)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)
- [Testing](#testing)
- [API Reference](#api-reference)
- [Security](#security)
- [Contributing](#contributing)

## Motivation

Health care in the United States is expensive and complex. In 2015, individuals in the U.S. spent roughly $9,990 on health-related expenses, 32% of which was for hospital care. We sought to create an app that will help users utilize their available health care options by informing them about the presence and affordability of local medical services in conjunction with a personal health log.

## Key Features

The Health Decoder combines three key features: a self-diagnostic tool, a patient health log, and a health care resources hub.

### Quick Diagnosis

An interactive body diagram built using [ApiMedic](http://apimedic.com/) with clickable parts for targeting symptoms and generating suggestions for possible ailments. Users can enter an unlimited number of symptoms and receive a range of ailments with likelihood percentages.

### Health Log

A personalized record of symptoms and treatments displayed in an easy-to-read scrolling log and calendar format. Each symptom log entry consists of:
- Symptom name
- Subjective severity rating (discrete integer scale)
- Date logged

### Health Resources

A hub for useful health care information including:
- **Emergency Level**: Tips for deciding if symptoms warrant a hospital visit
- **Pain Chart**: Subjective pain scale for assessing symptom severity
- **Nearby Clinics**: Google Maps integration for finding health services
- **Events**: Health-related events from Brandeis University RSS feed
- **Student Groups**: Information about health-related student groups

### Copay Calculator

Registered users can calculate expected out-of-pocket costs using their insurance plan information, including:
- Maximum deductibles (in-network and out-of-network)
- Treatment categories covered by their plan
- Coinsurance rates

## Technology Stack

| Component | Technology |
|-----------|------------|
| Backend | Ruby 2.4.1, Rails 5.1.4 |
| Database | PostgreSQL (production), SQLite (development) |
| Frontend | Bootstrap 3.3.7, Material Design Lite, jQuery |
| APIs | ApiMedic, Google Maps |
| Authentication | bcrypt, OmniAuth (Google OAuth2) |
| Deployment | Heroku, Codeship (CI/CD) |

## Installation

### Prerequisites

- Ruby 2.4.1 (use rbenv or rvm)
- Bundler
- PostgreSQL (for production)
- SQLite3 (for development)

### Setup

1. Clone the repository:
```bash
git clone https://github.com/ziyuqiu/health-insurance-decoder.git
cd health-insurance-decoder
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
rails db:create
rails db:migrate
rails db:seed
```

## Configuration

This application uses [Figaro](https://github.com/laserlemon/figaro) for environment variable management.

1. Create the configuration file:
```bash
bundle exec figaro install
```

2. Edit `config/application.yml` with your API keys:
```yaml
# Google OAuth
GOOGLE_CLIENT_ID: "your_client_id"
GOOGLE_CLIENT_SECRET: "your_client_secret"

# ApiMedic (for diagnosis feature)
APIMEDIC_API_KEY: "your_api_key"
APIMEDIC_SECRET_KEY: "your_secret_key"

# Google Maps
GOOGLE_MAPS_API_KEY: "your_maps_api_key"

# Pushpad (notifications)
PUSHPAD_PROJECT_ID: "your_project_id"
PUSHPAD_AUTH_TOKEN: "your_auth_token"
```

## Running the Application

### Development

```bash
rails server
```

Visit `http://localhost:3000`

### Production

The application is configured for Heroku deployment:

```bash
heroku create
git push heroku master
heroku run rails db:migrate
heroku run rails db:seed
```

## Testing

Run the test suite:

```bash
# Run all tests
rails test

# Run specific test file
rails test test/models/plan_test.rb

# Run with verbose output
rails test -v
```

### Test Coverage

Key test files:
- `test/models/plan_test.rb` - Insurance cost calculation tests
- `test/models/user_test.rb` - User model validation tests
- `test/controllers/` - Controller integration tests

## API Reference

### Plan#calculate(price, deductible, network, copay)

Calculates patient out-of-pocket expenses for a medical service.

**Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| `price` | Float | Total cost of the medical service |
| `deductible` | Float | Remaining deductible amount |
| `network` | String | "true" for in-network, "false" for out-of-network |
| `copay` | Copay | Copay record containing rates |

**Returns:** Float - Patient's out-of-pocket cost

**Calculation Logic:**
1. If price ≤ copay: patient pays full price
2. Otherwise: patient pays copay + deductible + (remaining × coinsurance rate)

**Example:**
```ruby
plan = Plan.find(1)
copay = plan.copays.find_by(treatment_id: treatment.id)

# In-network service: $100, $50 deductible remaining
cost = plan.calculate(100, 50, "true", copay)
# => 77.5 (assuming $25 copay, 10% coinsurance)
```

### Log Search

**Endpoint:** `GET /logs/display_log_search_results`

**Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| `symptom_name` | String | Symptom name to search for (partial match) |

**Response:** JSON array of matching log entries

## Security

See [SECURITY.md](SECURITY.md) for detailed security information including:
- Fixed vulnerabilities (SQL injection)
- Known issues requiring attention
- Deprecated dependencies
- Security checklist for production deployment

**Important:** This application uses deprecated versions of Ruby and Rails. A full upgrade is recommended before production deployment.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow Ruby style guide
- Write tests for new functionality
- Update documentation as needed
- See [SECURITY.md](SECURITY.md) before making security-related changes

## License

This project is for educational purposes.

## Acknowledgments

- [ApiMedic](http://apimedic.com/) for diagnosis API
- [Material Design Lite](https://getmdl.io/) for UI components
- Brandeis University Health Center for guidance on health resources
