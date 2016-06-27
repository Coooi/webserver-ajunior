name 'webserver'
description 'Systems that serve HTTP and HTTPS'

run_list("recipe[webserver-ajunior::default]","recipe[webserver-ajunior::mysql]","recipe[webserver-ajunior::sites]")
