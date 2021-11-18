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
  Misc Projects
  Should cover projects that have various purposes
 *****************************************/

/******************************************
  Testing
  This project can be used the most frequently for generic testing
  Will include a network (deployed by 05 pipeline) that allows ingress access via IAP and egress via Cloud NAT
 *****************************************/

module "testing_project" {
  source = "github.com/john-hurringjr/gcp-modules//project-creation/simple/v1?ref=main"
  project_id_category = "test"
  project_id_unique   = var.project_id_unique
  folder_id           = data.terraform_remote_state.rs_02_folders_iam_policies.outputs.folder_ids.misc
  billing_account_id  = var.billing_account_id
  project_admin_id    = var.project_admin_id
}


module "testing_project_vpc" {
  source = "github.com/john-hurringjr/gcp-modules//packaged-solutions/networking/vpc-iap-nat/v1?ref=main"
  project_id = module.testing_project.project_id
}
