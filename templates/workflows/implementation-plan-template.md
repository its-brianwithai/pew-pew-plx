---
name: implementation-plan-template
description: Use this template when in Phase 5 of the plan workflow to create detailed implementation plans with acceptance criteria, CRUD operations, and step-by-step action plans for each user story.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# 🛠️ Implementation Plan: [Project Name]
> 💡 *Detailed implementation planning that provides developers with clear, actionable steps for each user story. This document ensures consistent and complete implementation.*

[Brief overview of what's being implemented]

---

## ✅ Acceptance Criteria
> 💡 *Technical acceptance criteria for each deliverable, including integration tests, performance benchmarks, code quality standards, and documentation requirements.*

[Define acceptance criteria per deliverable]

```
<example>
### [[user-registration-flow]]

#### Technical Acceptance Criteria
- [ ] Unit tests achieve 80% code coverage
- [ ] Integration tests cover all API endpoints
- [ ] Response time under 200ms for form submission
- [ ] Input validation prevents SQL injection
- [ ] Error handling covers all edge cases

#### Integration Test Scenarios
- [ ] Valid registration completes successfully
- [ ] Duplicate email shows appropriate error
- [ ] Invalid email format rejected
- [ ] Weak password rejected with guidance
- [ ] Email verification link expires after 24 hours

#### Performance Benchmarks
- [ ] Form validation completes in < 50ms
- [ ] API response time < 200ms (95th percentile)
- [ ] Database queries optimized with indexes
- [ ] No N+1 query problems

#### Code Quality Standards
- [ ] Follows [[coding-standards]] guidelines
- [ ] No linting errors or warnings
- [ ] Code review approved by senior developer
- [ ] Security scan passes without issues

#### Documentation Requirements
- [ ] API endpoints documented in [[api-docs]]
- [ ] Component usage examples provided
- [ ] Error codes and messages documented
- [ ] Deployment steps included in README
</example>
```

---

## 🔧 High-Level CRUD Planning
> 💡 *Identify Create, Read, Update, and Delete operations needed for each user story. Map these operations to specific deliverables and components.*

[Define CRUD operations per user story]

```
<example>
### Story: User Registration

#### Create Operations
- **User Account Record**
  - Table: [[users-table]]
  - Fields: email, password_hash, created_at, status
  - Validation: Email uniqueness, password strength
  
- **Email Verification Token**
  - Table: [[verification-tokens-table]]
  - Fields: token, user_id, expires_at
  - Logic: Generate unique token, set 24hr expiry

#### Read Operations
- **Check Email Exists**
  - Query: SELECT id FROM users WHERE email = ?
  - Index: email_unique_idx
  - Purpose: Prevent duplicate registrations

- **Validate Verification Token**
  - Query: SELECT * FROM verification_tokens WHERE token = ? AND expires_at > NOW()
  - Purpose: Confirm email ownership

#### Update Operations
- **Activate User Account**
  - Update: UPDATE users SET status = 'active', verified_at = NOW() WHERE id = ?
  - Trigger: After successful email verification
  
#### Delete Operations
- **Remove Expired Tokens**
  - Delete: DELETE FROM verification_tokens WHERE expires_at < NOW()
  - Schedule: Daily cleanup job
</example>
```

---

## 📋 Detailed Action Plan
> 💡 *Step-by-step implementation instructions for each CRUD operation. Specify exact files to modify/create, code changes needed, and testing approach.*

[Provide detailed implementation steps]

```
<example>
### Create User Account Record

#### Step 1: Create Database Migration
**File**: `migrations/001_create_users_table.sql`
**Action**: Create new file
**Content**:
- Define users table schema
- Add email unique constraint
- Add indexes for performance
- Include timestamps

#### Step 2: Create User Model
**File**: `models/user.js`
**Action**: Create new file
**Content**:
- Define User class with properties
- Add validation methods
- Implement password hashing
- Add factory method for creation

#### Step 3: Create Registration Service
**File**: `services/auth/registration.js`
**Action**: Create new file
**Content**:
- Implement registerUser method
- Add email uniqueness check
- Hash password using bcrypt
- Generate verification token
- Send verification email

#### Step 4: Create API Endpoint
**File**: `routes/auth.js`
**Action**: Modify existing file
**Changes**:
- Add POST /register endpoint
- Validate request body
- Call registration service
- Return success/error response

#### Step 5: Add Input Validation
**File**: `validators/auth.js`
**Action**: Create new file
**Content**:
- Email format validation
- Password strength rules
- Request body schema

#### Step 6: Create Frontend Form
**File**: `components/RegistrationForm.jsx`
**Action**: Create new file
**Content**:
- Form with email/password fields
- Client-side validation
- API integration
- Error handling
- Success feedback

#### Testing Approach
1. Unit test User model validation
2. Unit test registration service logic
3. Integration test API endpoint
4. E2E test full registration flow
5. Load test for performance benchmarks
</example>
```
