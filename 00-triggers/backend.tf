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
  Backend State Reference
 *****************************************/

// Manually enter your backend bucket name that you created from cloud shell using the trigger.tf
// for example: terraform-backend-first-trigger-dkjghiuetkj
terraform {
  backend "gcs" {
    bucket = "terraform-backend-first-trigger-hm4252224452kf590" #TODO - Replace with your value
  }
}
