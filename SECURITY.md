# Security Policy

## Current Security Status

This application was built in 2017-2018 using Rails 5.1.4 and Ruby 2.4.1, both of which are now end-of-life.

## Fixed Vulnerabilities

### SQL Injection (FIXED)

**Location:** `app/controllers/logs_controller.rb:94`

**Original Code (Vulnerable):**
```ruby
@results = Log.joins(:symptom).where("symptoms.name LIKE '%#{params[:symptom_name]}%'")
```

**Fixed Code:**
```ruby
@results = Log.joins(:symptom).where("symptoms.name LIKE ?", "%#{params[:symptom_name]}%")
```

The fix uses parameterized queries to prevent SQL injection attacks.

## Known Issues Requiring Attention

### 1. Global Variables (MEDIUM)

**Location:** Multiple controllers use `$flag` for state management

**Files Affected:**
- `app/controllers/logs_controller.rb`
- `app/controllers/sessions_controller.rb`
- `app/controllers/home_controller.rb`

**Risk:** Thread safety issues in production environments.

**Recommendation:** Replace with session-based state management:
```ruby
# Instead of: $flag = 1
session[:redirect_to_logs] = true
```

### 2. Debug Statements (LOW - Partially Fixed)

Debug `puts` statements have been removed from `logs_controller.rb`.

**Remaining locations to check:**
- `app/controllers/body_parts_controller.rb`
- `app/controllers/visits_controller.rb`
- JavaScript files (`console.log` statements)

### 3. Email Validation (MEDIUM)

**Location:** `app/models/user.rb:7`

```ruby
validates :email, presence: false
```

Email validation is optional, which may allow accounts without valid emails.

**Recommendation:** Change to `presence: true` if email is required for authentication.

### 4. Password Requirements (LOW)

**Location:** `app/models/user.rb:11`

Current minimum: 6 characters

**Recommendation:** Increase to 8-12 characters minimum.

## Deprecated Dependencies

| Dependency | Current Version | Status | Recommendation |
|------------|-----------------|--------|----------------|
| Rails | 5.1.4 | EOL (June 2020) | Upgrade to 7.x |
| Ruby | 2.4.1 | EOL (March 2020) | Upgrade to 3.x |
| jQuery | 1.12.2 | Very Old | Upgrade or remove |
| Bootstrap | 3.3.7 | Outdated | Upgrade to 5.x |
| pg | 0.20.0 | Outdated | Upgrade to 1.x |
| Capybara | 2.13 | Outdated | Upgrade to 3.x |

## Security Checklist

Before production deployment:

- [x] Fix SQL injection vulnerability
- [x] Remove debug statements from logs_controller
- [ ] Remove remaining debug statements
- [ ] Replace global variables with session storage
- [ ] Enable email validation
- [ ] Strengthen password requirements
- [ ] Upgrade Rails to supported version
- [ ] Upgrade Ruby to supported version
- [ ] Update all gem dependencies
- [ ] Add rate limiting to authentication endpoints
- [ ] Review CORS configuration
- [ ] Enable HTTPS in production

## Reporting Vulnerabilities

If you discover a security vulnerability:

1. Do not open a public issue
2. Email the maintainers directly
3. Allow time for a fix before public disclosure
