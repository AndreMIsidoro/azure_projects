variable "subscription_id" {
  description = "Azure Subscription ID where the budget will be applied"
  type        = string
}

variable "contact_emails" {
  description = "List of email addresses to notify when budget thresholds are crossed"
  type        = list(string)
}
