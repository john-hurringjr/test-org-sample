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
  Org IAM
 *****************************************/

module "org_iam" {
  source = "github.com/john-hurringjr/gcp-modules//org-iam/basic/v1?ref=main"

  your_id         = var.your_id
  organization_id = var.organization_id

  org_iam_org_policies_service_account_id   = var.org_iam_policies_service_account
  folder_structure_service_account_id       = var.folder_structure_service_account_id
  base_projects_service_account_id          = var.base_projects_service_account_id
}