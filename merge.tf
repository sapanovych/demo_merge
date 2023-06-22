locals {
    automated_path = "./variabels/automated.yaml"
    manual_path = "./variabels/manual.yaml"
    automated_only_path = "./variabels/automated_only.yaml"
    
    automated = fileexists(local.automated_path) ? file(local.automated_path) : yamlencode({})
    manual = fileexists(local.manual_path) ? file(local.manual_path) : yamlencode({})
    automated_only = fileexists(local.automated_only_path) ? file(local.automated_only_path) : yamlencode({})

    settings = merge(        
        yamldecode(local.automated),
        yamldecode(local.manual),
        yamldecode(local.automated_only)

    )
}

output "project_settings" {
    value = local.settings
}