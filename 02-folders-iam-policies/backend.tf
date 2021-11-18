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

// Manually enter your backend bucket name that you created from the 00 pipeline
// If you follow the same naming convention your prefix should stay the same
// Prefix should match what you passed in as the code folder in your trigger pipeline (i.e. should map the name of the folder that this code is in)

terraform {
  backend "gcs" {
    bucket = "terraform-backends-ua234234" //TODO Replace with your backend created by 00 pipeline
    prefix = "02-folders-iam-policies"
  }
}
