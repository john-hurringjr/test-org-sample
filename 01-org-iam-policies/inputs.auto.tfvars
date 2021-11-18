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
  Inputs
 *****************************************/
// Your billing account ID
billing_account_id  = "" #TODO - Add value
organization_id     = "" #TODO - Add value
your_id             = "" #TODO - Add value

// These next SA's you can just grab from the console in your iac project
// It's 01, 02, 03 SA"s respectively

// SA created that this pipeline runs as (01 pipeline)
org_iam_policies_service_account = "" #TODO - Add value

// SA for 02 folders
folder_structure_service_account_id = "" #TODO - Add value

// SA for 03 projects
base_projects_service_account_id = "" #TODO - Add value

// Domain Identities
// You can run: gcloud organizations list
// In the results you'll see "DIRECTORY_CUSTOMER_ID", use that value for the domains you want to permit in IAM
// Two examples are below, but add as many as required
domain_identities = [
  "", #TODO - Add value - And it's recommended to comment with the domain name (This can be your ID's domain)
  "", #TODO - Add value - And it's recommended to comment with the domain name (This should be the domain of the test org)
]