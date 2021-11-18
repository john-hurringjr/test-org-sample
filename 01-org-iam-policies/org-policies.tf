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
  Org Policies
 *****************************************/

module "org_policies" {
  source = "github.com/john-hurringjr/gcp-modules//org-policies/bare-minimum/v1?ref=main"

  organization_id = var.organization_id

  domain_identities = var.domain_identities

}
