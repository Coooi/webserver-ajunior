
mysql_service 'sites' do
  port '3306'
  version '5.5'
  bind_address '0.0.0.0'
  initial_root_password 'root'
  action [:create, :start]
end
