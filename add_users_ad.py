from pyad import *
pyad.set_defaults(ldap_server="dc1.domain.com", username="service_account", password="mypassword")
ou = ADContainer.from_dn("ou=users, dc=domain, dc=com")
new_user = ADUser.create("Daniel", ou, password="Secret")

new_user.set_attribute("mail", "daniel@example.com")  #change attributes
group = ADGroup.from_dn("so-users")
group.add_member(new_user)

new_user.delete() #delete user