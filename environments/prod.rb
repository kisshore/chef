name "prod"
description "Environment for Production servers"
cookbook "apache", "= 0.1.0"
override_attributes({
    "pci" => {
        "in_scope" => false
    }
})