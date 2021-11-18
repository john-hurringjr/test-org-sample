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
  Triggers to be created
 *****************************************/

module "bootstrap_trigger_creation" {
    source                = "github.com/john-hurringjr/gcp-modules//cloud-build-triggers/terraform-pipeline/v1?ref=main"
  project_id            = var.project_id
  github_repo_owner     = var.github_repo_owner
  github_repo_name      = var.github_repo_name
  code_folders          = var.code_folders

}

