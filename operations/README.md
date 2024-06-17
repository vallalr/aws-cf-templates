# Operations Templates for AWS CloudFormation

Find the documentation here: https://templates.cloudonaut.io/en/stable/operations/

# AWS Budget Alerts CloudFormation Template

## Description
This CloudFormation template is designed to create budget alerts for specific AWS services. It allows you to set up budgets and receive notifications when spending exceeds specified thresholds.

## Features
- **Budget Creation**: Automatically creates budgets for a list of predefined AWS services.
- **Notification Setup**: Configures notifications to alert you when spending exceeds certain thresholds.
- **Customizable Parameters**: Allows customization of budget limits, notification thresholds, and time units.

## Prerequisites
- AWS CLI installed and configured with appropriate permissions.
- An SNS topic created for receiving budget notifications.
- A parent alert stack name that exports the SNS topic ARN.

## Parameters
- **ParentAlertStack**: The name of the parent alert stack.
- **ServiceName**: The name of the AWS service for which to set up the budget.
- **BudgetLimit**: The budget limit amount (in USD).
- **NotificationThreshold**: The first percentage threshold for sending budget notifications.
- **NotificationThreshold2**: The second percentage threshold for sending budget notifications.
- **TimeUnit**: The time unit for the budget (DAILY, MONTHLY, QUARTERLY, ANNUALLY).

## Usage

### Creating Budget Alerts

1. **Define Services and Parameters**:
   - Modify the `services` array in the provided bash script to include the AWS services you want to monitor.
   - Set other parameters such as `parent_alert_stack`, `time_unit`, `aws_profile`, and `aws_region`.

2. **Run the Script**:
   - Execute the bash script to create CloudFormation stacks for each service.
   ```bash
   ./create-budget-alerts.sh
   ```

3. **Monitor Stacks**:
   - Check the AWS CloudFormation console to ensure all stacks are created successfully.
   - Verify that budgets and notifications are set up correctly in the AWS Budgets console.

### Deleting Budget Alerts

1. **Run the Deletion Script**:
   - Execute the bash script to delete CloudFormation stacks for each service.
   ```bash
   ./delete-budget-alerts.sh
   ```

2. **Monitor Deletions**:
   - Check the AWS CloudFormation console to ensure all stacks are deleted successfully.
