---
name: activecampaign
description: ActiveCampaign CRM integration for lead management, deal tracking, and email automation. Use for syncing demo leads, managing clinic sales pipeline, and triggering follow-up sequences.
metadata: {"openclaw":{"emoji":"📧","requires":{"bins":["activecampaign"],"env":["ACTIVECAMPAIGN_URL","ACTIVECAMPAIGN_API_KEY"]},"primaryEnv":["ACTIVECAMPAIGN_URL","ACTIVECAMPAIGN_API_KEY"]}}
---

# ActiveCampaign Skill 📧

ActiveCampaign integration for ShapeScale sales automation.

## Purpose

Manage leads, deals, and email automations for clinic sales:
- **Contacts**: Sync demo attendees, leads, and prospects
- **Deals**: Track clinic sales pipeline stages
- **Tags**: Segment leads (demo-requested, nurture, close-ready)
- **Automations**: Trigger email sequences based on actions

## Setup

```bash
# Create config directory
mkdir -p ~/.config/activecampaign

# Add credentials to environment or config
echo "https://yourname.api-us1.com" > ~/.config/activecampaign/url
echo "your_api_key_here" > ~/.config/activecampaign/api_key

# Export for skill (add to .bashrc or profile)
export ACTIVECAMPAIGN_URL=$(cat ~/.config/activecampaign/url)
export ACTIVECAMPAIGN_API_KEY=$(cat ~/.config/activecampaign/api_key)
```

Get API credentials from ActiveCampaign:
- **URL**: Settings → Developer → API Access (copy the API URL)
- **API Key**: Settings → Developer → API Access (copy the API Key)

## Usage

```bash
# Set credentials once per session
export ACTIVECAMPAIGN_URL="https://youraccount.api-us1.com"
export ACTIVECAMPAIGN_API_KEY="your-api-key"

# Contacts
activecampaign contacts list                    # List all contacts
activecampaign contacts create "email@test.com" "First Last"  # Create contact
activecampaign contacts sync "email@test.com"               # Create or update
activecampaign contacts get <id>                # Get contact by ID
activecampaign contacts search "clinic"         # Search contacts
activecampaign contacts add-tag <id> <tag>      # Add tag to contact
activecampaign contacts remove-tag <id> <tag>   # Remove tag from contact

# Deals
activecampaign deals list                       # List all deals
activecampaign deals create "Clinic Name" <stage_id> <value>  # Create deal
activecampaign deals update <id> stage=<stage_id>            # Move deal stage
activecampaign deals get <id>                   # Get deal details

# Tags
activecampaign tags list                        # List all tags
activecampaign tags create "Demo Requested"     # Create new tag
activecampaign tags sync <contact_id> <tag_id>  # Sync tag to contact

# Automations
activecampaign automations list                 # List automations
activecampaign automations add-contact <id> <automation_id>  # Add contact

# Pipelines/Stages
activecampaign pipelines list                   # List pipelines
activecampaign stages list                      # List stages in pipeline
```

## Contact Fields (POST /api/3/contact/sync)

```json
{
  "contact": {
    "email": "clinic@example.com",
    "firstName": "Dr.",
    "lastName": "Smith",
    "phone": "+1-555-123-4567"
  },
  "fieldValues": [
    {"field": "1", "value": "Medical Spa"},
    {"field": "2", "value": "1000-2000 sq ft"}
  ]
}
```

## Common ShapeScale Workflows

### Sync Demo Lead
```bash
# 1. Create/update contact
activecampaign contacts sync "lead@clinic.com" "Dr. Smith"

# 2. Tag as "Demo Requested"
activecampaign tags create "Demo Requested"
# Get tag ID, then:
activecampaign contacts add-tag <contact_id> <tag_id>

# 3. Add to follow-up automation
activecampaign automations add-contact <contact_id> <automation_id>
```

### Update Deal Stage
```bash
# List available stages first
activecampaign stages list

# Move deal to "Proposal Sent"
activecampaign deals update <deal_id> stage=<stage_id> value=5000
```

## Rate Limits

- **5 requests per second** max
- Use batch operations for bulk imports
- The wrapper handles rate limiting automatically

## Related Skills

- `shapescale-crm` - Attio CRM integration (source of truth)
- `shapescale-sales` - Sales workflows and qualification
- `campaign-orchestrator` - Multi-channel follow-up campaigns
