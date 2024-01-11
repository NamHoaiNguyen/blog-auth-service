-- Role info

INSERT INTO role (role_id, role_name) VALUES (1, 'admin');

INSERT INTO role (role_id, role_name) VALUES (2, 'normal_account');

-- Module info

INSERT INTO module (module_id, module_name, module_description) VALUES (1, 'account_service', 'account service');

INSERT INTO module (module_id, module_name, module_description) VALUES (2, 'post_service', 'post service');

-- Module_role info

-- INSERT INTO module_role (module_id, role_id) VALUES (1, 1);

-- INSERT INTO module_role (module_id, role_id) VALUES (1, 2);

-- INSERT INTO module_role (module_id, role_id) VALUES (2, 1);

-- INSERT INTO module_role (module_id, role_id) VALUES (2, 2);

-- General_Scope info

INSERT INTO general_scope (scope_id, module_id, role_id, scope, module_description) 
  VALUES (1, 1, 1, 'account_info_admin', 'This scope is applied for admin account superset of all other account inner scopes');

INSERT INTO general_scope (scope_id, module_id, role_id, scope, module_description) 
  VALUES (2, 1, 2, 'account_info', 'This scope is applied for normal account and superset of normal account inner scopes');

INSERT INTO general_scope (scope_id, module_id, role_id, scope, module_description) 
  VALUES (3, 2, 1, 'post_info_admin', 'This scope is applied for admin account superset of all other post inner scopes');

INSERT INTO general_scope (scope_id, module_id, role_id, scope, module_description) 
  VALUES (4, 2, 2, 'post_info', 'This scope is applied for normal account and superset of normal post inner scopes');


-- Inner_Scope info

-- List of inner scope belongs to account service. These scopes belongs to both admin and normal_account

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (1, 1, 1, "user_email", "Scope for admin and normal_account to CRUD email info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (2, 2, 2, "user_email", "Scope for admin and normal_account to CRUD email info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (3, 1, 1, "user_gender", "Scope for admin and normal_account to CRUD gender info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (4, 2, 2, "user_gender", "Scope for admin and normal_account to CRUD gender info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (5, 1, 1, "user_birth", "Scope for admin and normal_account to CRUD birth info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (6, 2, 2, "user_birth", "Scope for admin and normal_account to CRUD birth info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (7, 1, 1, "user_phone", "Scope for admin and normal_account to CRUD phone info");a

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (8, 2, 2, "user_phone", "Scope for admin and normal_account to CRUD phone info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (9, 1, 1, "username", "Scope for admin and normal_account to CRUD username info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (10, 2, 2, "username", "Scope for admin and normal_account to CRUD username info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (11, 1, 2, "user_gender", "Scope for admin and normal_account to CRUD gender info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (12, 2, 2, "user_gender", "Scope for admin and normal_account to CRUD gender info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (13, 1, 2, "user_firstname", "Scope for admin and normal_account to CRUD firstname info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (14, 2, 2, "user_firstname", "Scope for admin and normal_account to CRUD firstname info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (15, 1, 2, "user_lastname", "Scope for admin and normal_account to CRUD lastname info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (16, 2, 2, "user_lastname", "Scope for admin and normal_account to CRUD lastname info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (17, 1, 2, "delete_account", "Scope for admin and normal_account to CRUD lastname info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (18, 2, 2, "delete_account", "Scope for admin and normal_account to CRUD lastname info");

-- Ending List of inner scope belongs to account service 


-- List of inner scope belongs to post service. These scopes belongs to both admin and normal_account

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (18, 3, 1, "create_post", "Scope for admin and normal_account to create post info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (19, 4, 2, "create_post", "Scope for admin and normal_account to create post info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (20, 3, 1, "update_post", "Scope for admin and normal_account to update post info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (21, 4, 2, "update_post", "Scope for admin and normal_account to update post  info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (22, 3, 1, "delete_post", "Scope for admin and normal_account to delete post info");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (23, 4, 2, "delete_post", "Scope for admin and normal_account to delete post info");

-- Ending List of inner scope belongs to post service 


-- List of inner scopes only belongs to admin's permission
-- Only admin can recover deleted account
INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (24, 1, 1, "recover_deleted_account", "Scope for only admin to recover deleted account");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (25, 1, 1, "promote_account", "Scope for only admin to promote account");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (26, 1, 1, "demote_account", "Scope for only admin to demote account. For Ex: An admin account can be demoted to normal account");

INSERT INTO inner_scope (inner_scope_id, general_scope_id, role_id, scope, module_description)
  VALUES (27, 3, 1, "recover_deleted_post", "Scope for only admin to recover deleted account");

-- Ending List of inner scopes only belongs to admin's permission