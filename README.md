# ActiveCampaign Skill for OpenClaw

ActiveCampaign CRM integration for ShapeScale sales automation.

## Features

- **Contacts**: Create, sync, search, and tag leads
- **Deals**: Manage sales pipeline stages
- **Tags**: Segment and organize contacts
- **Automations**: Trigger email sequences

## Setup

### 1Password (Recommended)
Add credentials to 1Password vault `Clawd` with item name `ActiveCampaign`:
- `url`: Your ActiveCampaign API URL
- `api_key`: Your ActiveCampaign API key

### Or use config files
```bash
mkdir -p ~/.config/activecampaign
echo "https://youraccount.api-us1.com" > ~/.config/activecampaign/url
echo "your-api-key" > ~/.config/activecampaign/api_key
```

### Or environment variables
```bash
export ACTIVECAMPAIGN_URL="https://youraccount.api-us1.com"
export ACTIVECAMPAIGN_API_KEY="your-api-key"
```

## Usage

```bash
# Contacts
activecampaign contacts list
activecampaign contacts sync "email@clinic.com" "Dr." "Smith"
activecampaign contacts add-tag <contact_id> <tag_id>

# Deals
activecampaign deals list
activecampaign deals create "Clinic Name" <stage_id> 5000

# Tags
activecampaign tags list
activecampaign tags create "Demo Requested"

# Automations
activecampaign automations list
activecampaign automations add-contact <contact_id> <automation_id>
```

## ShapeScale Integration

This skill integrates with:
- `shapescale-crm` - Attio CRM for source of truth
- `shapescale-sales` - Sales qualification workflows
- `campaign-orchestrator` - Multi-channel follow-up campaigns

## License

MIT
