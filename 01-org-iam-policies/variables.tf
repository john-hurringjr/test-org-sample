/**
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/******************************************
  Variables
 *****************************************/
variable "organization_id" {}
variable "billing_account_id" {}

variable "your_id" {}

variable "org_iam_policies_service_account" {}
variable "folder_structure_service_account_id" {}
variable "base_projects_service_account_id" {}

variable "domain_identities" {
  type        = list(string)
  description = "Root domain identities. Allows all users with identity in domain to see org node. Helps users know they are working within appropriate space"
}