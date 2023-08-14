resource "huaweicloud_identity_agency" "hfa_cts_agency" {
    delegated_service_name = "op_svc_CTS"
    description            = "Created by HFA. To ensure that services run properly, do not delete this agency."
    duration               = "FOREVER"
    name                   = "cts_admin_trust"
    project_role {
        project = "ap-southeast-1"
        roles   = [
            "KMS Administrator",
            "SMN Administrator",
        ]
    }
    project_role {
        project = "ap-southeast-3"
        roles   = [
            "KMS Administrator",
            "SMN Administrator",
        ]
    }
    
    lifecycle {
      ignore_changes = [ 
        description
       ]
    }
}