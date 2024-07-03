terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.33, < 6"
    }
  }

   google-beta= {
 	 source = "hashicorp/google-beta"
 	 version = ">=3.61.0"
 	 
   }
}
