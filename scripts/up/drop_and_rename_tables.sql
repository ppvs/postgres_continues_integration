
DROP TABLE auth_group, auth_group_permissions, auth_permission,authtoken_token,django_admin_log,django_content_type,django_migrations,django_session,
	guardian_groupobjectpermission,guardian_userobjectpermission,simple_email_confirmation_emailaddress,tbim_activity,tbim_activitygroup,
	tbim_bimhandle,tbim_bimhandlegroup,tbim_bimobject,tbim_bimobject_bim_handles,tbim_bimrel,tbim_description,tbim_description_raw_data,tbim_geometryitem,
	tbim_material,tbim_material_bim_handles,tbim_material_structural_data,tbim_material_thermal_data,tbim_prediction,tbim_projectresourcetemplates,
	tbim_rawdata,tbim_resourcelimitations,tbim_resourcetemplates,tbim_resourcetypes,thermal_data_map,tuser_invitation,tuser_myuser_groups,
	tuser_myuser_user_permissions,tuser_notification,twork_cost,twork_externalcodes,twork_extractor,twork_geopos,twork_resource,twork_resourcetype,
	twork_tag,twork_vendors,twork_work,twork_work_extractors,twork_work_tags,tuser_invitation
CASCADE;

ALTER TABLE bim_handle RENAME TO handle;
ALTER TABLE bim_meta RENAME TO meta;
ALTER TABLE bim_rel RENAME TO rel;
ALTER TABLE element_element RENAME TO element;
ALTER TABLE element_uniclass RENAME TO uniclass;
ALTER TABLE geometry_item RENAME TO item;
ALTER TABLE tbim_bimdocument RENAME TO bimdocument;
ALTER TABLE tbim_calculation RENAME TO calculation;
ALTER TABLE tbim_constructioncost RENAME TO constructioncost;
ALTER TABLE tbim_ganttdata RENAME TO ganttdata;
ALTER TABLE tbim_preliminaries RENAME TO preliminaries;
ALTER TABLE tbim_scenario RENAME TO scenario;
ALTER TABLE tplan_country RENAME TO country;
ALTER TABLE tplan_region RENAME TO region;
ALTER TABLE tuser_myuser RENAME TO myuser;


CREATE TABLE IF NOT EXISTS material (
	id	serial primary key,
	name	text
);
CREATE TABLE IF NOT EXISTS handle (
	id	serial primary key,
	bim_handle_type	text
);
CREATE TABLE IF NOT EXISTS description (
	id	serial primary key,
	source_type	text,
	source_id	text,
	category	text,
	family	text,
	element_type	text,
	bim_handle_id	integer
);
CREATE TABLE IF NOT EXISTS raw_data (
	id	serial primary key,
	key	text,
	storage_type	text,
	double_value	double precision,
	string_value	text,
	integer_value	integer
);

CREATE TABLE IF NOT EXISTS thermal_data_map (
	material_id	integer references material(id),
	raw_data_id	integer references raw_data(id)
);
CREATE TABLE IF NOT EXISTS structural_data_map (
	material_id	integer references material(id),
	raw_data_id	integer references raw_data(id)
);

CREATE TABLE IF NOT EXISTS material_map (
	bim_handle_id	integer references handle(id),
	material_id	integer references material(id)
);

CREATE TABLE IF NOT EXISTS geometry_item (
	id	serial primary key,
	geometry_type	text,
	data	text,
	bim_handle_id	integer references handle(id)
);
CREATE TABLE IF NOT EXISTS description_data_map (
	description_id	integer references description(id),
	raw_data_id	integer references raw_data(id)
);

CREATE TABLE IF NOT EXISTS bim_rel (
	main_id	integer,
	related_id	integer,
	bim_rel_type	text,
    bimdocuments_id integer references bimdocument(id)
);
CREATE TABLE IF NOT EXISTS bim_meta (
	version	text
);

