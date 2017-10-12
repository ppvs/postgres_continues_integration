--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: bim_handle; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bim_handle (
    id integer NOT NULL,
    bim_handle_type text
);


--
-- Name: bim_handle_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bim_handle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bim_handle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bim_handle_id_seq OWNED BY bim_handle.id;


--
-- Name: bim_meta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bim_meta (
    version text
);


--
-- Name: bim_rel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE bim_rel (
    main_id integer,
    related_id integer,
    bim_rel_type text,
    bimbocument_id integer
);


--
-- Name: description; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE description (
    id integer NOT NULL,
    source_type text,
    source_id text,
    category text,
    family text,
    element_type text,
    bim_handle_id integer
);


--
-- Name: description_data_map; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE description_data_map (
    description_id integer,
    raw_data_id integer
);


--
-- Name: description_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE description_id_seq OWNED BY description.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: element_element; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE element_element (
    id integer NOT NULL,
    system_str character varying(20) NOT NULL,
    product_str character varying(20) NOT NULL,
    status character varying(1) NOT NULL,
    product_id integer NOT NULL,
    system_id integer NOT NULL
);


--
-- Name: element_element_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE element_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: element_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE element_element_id_seq OWNED BY element_element.id;


--
-- Name: element_uniclass; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE element_uniclass (
    id integer NOT NULL,
    code text NOT NULL,
    description text NOT NULL,
    "table" text NOT NULL
);


--
-- Name: element_uniclass_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE element_uniclass_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: element_uniclass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE element_uniclass_id_seq OWNED BY element_uniclass.id;


--
-- Name: geometry_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE geometry_item (
    id integer NOT NULL,
    geometry_type text,
    data text,
    bim_handle_id integer
);


--
-- Name: geometry_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE geometry_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: geometry_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE geometry_item_id_seq OWNED BY geometry_item.id;


--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE guardian_groupobjectpermission_id_seq OWNED BY guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE guardian_userobjectpermission_id_seq OWNED BY guardian_userobjectpermission.id;


--
-- Name: material; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE material (
    id integer NOT NULL,
    name text
);


--
-- Name: material_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE material_id_seq OWNED BY material.id;


--
-- Name: material_map; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE material_map (
    bim_handle_id integer,
    material_id integer
);


--
-- Name: raw_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE raw_data (
    id integer NOT NULL,
    key text,
    storage_type text,
    double_value double precision,
    string_value text,
    integer_value integer
);


--
-- Name: raw_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE raw_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: raw_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE raw_data_id_seq OWNED BY raw_data.id;


--
-- Name: simple_email_confirmation_emailaddress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE simple_email_confirmation_emailaddress (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    key character varying(40) NOT NULL,
    set_at timestamp with time zone NOT NULL,
    confirmed_at timestamp with time zone,
    user_id integer NOT NULL
);


--
-- Name: simple_email_confirmation_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE simple_email_confirmation_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: simple_email_confirmation_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE simple_email_confirmation_emailaddress_id_seq OWNED BY simple_email_confirmation_emailaddress.id;


--
-- Name: structural_data_map; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE structural_data_map (
    material_id integer,
    raw_data_id integer
);


--
-- Name: tbim_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_activity (
    id integer NOT NULL,
    cost double precision NOT NULL,
    labor_cost double precision NOT NULL,
    plant_cost double precision NOT NULL,
    crew_multiplier double precision NOT NULL,
    material_cost double precision NOT NULL,
    code text NOT NULL,
    description text NOT NULL,
    activity_group_id integer NOT NULL,
    bim_object_id integer NOT NULL,
    calculation_id integer NOT NULL
);


--
-- Name: tbim_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_activity_id_seq OWNED BY tbim_activity.id;


--
-- Name: tbim_activitygroup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_activitygroup (
    id integer NOT NULL,
    code text NOT NULL,
    description text NOT NULL,
    full_description text NOT NULL,
    calculation_id integer NOT NULL
);


--
-- Name: tbim_activitygroup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_activitygroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_activitygroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_activitygroup_id_seq OWNED BY tbim_activitygroup.id;


--
-- Name: tbim_bimdocument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_bimdocument (
    id integer NOT NULL,
    project_guid character varying(36),
    name text NOT NULL,
    created timestamp with time zone NOT NULL,
    bim_file character varying(100) NOT NULL,
    is_deleted boolean NOT NULL,
    status character varying(2) NOT NULL,
    owner_id integer NOT NULL
);


--
-- Name: tbim_bimdocument_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_bimdocument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_bimdocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_bimdocument_id_seq OWNED BY tbim_bimdocument.id;


--
-- Name: tbim_bimhandle; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_bimhandle (
    id integer NOT NULL,
    bim_handle_type text NOT NULL,
    old_bim_id integer NOT NULL,
    bim_document_id integer NOT NULL,
    bim_handle_group_id integer NOT NULL
);


--
-- Name: tbim_bimhandle_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_bimhandle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_bimhandle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_bimhandle_id_seq OWNED BY tbim_bimhandle.id;


--
-- Name: tbim_bimhandlegroup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_bimhandlegroup (
    id integer NOT NULL,
    bim_document_id integer NOT NULL,
    predicted_classification_id integer,
    user_classification_id integer
);


--
-- Name: tbim_bimhandlegroup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_bimhandlegroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_bimhandlegroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_bimhandlegroup_id_seq OWNED BY tbim_bimhandlegroup.id;


--
-- Name: tbim_bimobject; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_bimobject (
    id integer NOT NULL,
    bim_document_id integer NOT NULL
);


--
-- Name: tbim_bimobject_bim_handles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_bimobject_bim_handles (
    id integer NOT NULL,
    bimobject_id integer NOT NULL,
    bimhandle_id integer NOT NULL
);


--
-- Name: tbim_bimobject_bim_handles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_bimobject_bim_handles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_bimobject_bim_handles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_bimobject_bim_handles_id_seq OWNED BY tbim_bimobject_bim_handles.id;


--
-- Name: tbim_bimobject_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_bimobject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_bimobject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_bimobject_id_seq OWNED BY tbim_bimobject.id;


--
-- Name: tbim_bimrel; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_bimrel (
    id integer NOT NULL,
    bim_rel_type text NOT NULL,
    main_id integer NOT NULL,
    related_id integer NOT NULL
);


--
-- Name: tbim_bimrel_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_bimrel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_bimrel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_bimrel_id_seq OWNED BY tbim_bimrel.id;


--
-- Name: tbim_calculation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_calculation (
    id integer NOT NULL,
    name text NOT NULL,
    calculation_id integer,
    calculation_guid character varying(36),
    average_labor_hours double precision NOT NULL,
    labor_cost double precision NOT NULL,
    material_cost double precision NOT NULL,
    plant_cost double precision NOT NULL,
    total_preliminaries_overhead double precision,
    total_cost double precision NOT NULL,
    total_duration interval NOT NULL,
    is_shown boolean NOT NULL,
    is_activated boolean NOT NULL,
    scenario_id integer NOT NULL
);


--
-- Name: tbim_calculation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_calculation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_calculation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_calculation_id_seq OWNED BY tbim_calculation.id;


--
-- Name: tbim_constructioncost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_constructioncost (
    id integer NOT NULL,
    quantity double precision,
    level_of_nesting integer,
    "innerId" text,
    "parentId" text,
    duration_per_off_si_unit_hours double precision,
    duration text,
    name text,
    off_si_unit text,
    labor_cost double precision,
    labor_cost_per_si_unit double precision,
    labor_cost_per_off_si_unit double precision,
    plant_cost double precision,
    plant_cost_per_si_unit double precision,
    plant_cost_per_off_si_unit double precision,
    material_cost double precision,
    material_cost_per_si_unit double precision,
    material_cost_per_off_si_unit double precision,
    direct_cost_per_si_unit double precision,
    direct_cost_per_off_si_unit double precision,
    direct_cost double precision,
    extra_payments_percentage double precision,
    total_cost double precision,
    calculation_id integer NOT NULL
);


--
-- Name: tbim_constructioncost_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_constructioncost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_constructioncost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_constructioncost_id_seq OWNED BY tbim_constructioncost.id;


--
-- Name: tbim_description; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_description (
    id integer NOT NULL,
    source_type text NOT NULL,
    source_id text NOT NULL,
    category text NOT NULL,
    family text NOT NULL,
    element_type text NOT NULL,
    bim_handle_id integer NOT NULL,
    bim_handle_group_id integer
);


--
-- Name: tbim_description_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_description_id_seq OWNED BY tbim_description.id;


--
-- Name: tbim_description_raw_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_description_raw_data (
    id integer NOT NULL,
    description_id integer NOT NULL,
    rawdata_id integer NOT NULL
);


--
-- Name: tbim_description_raw_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_description_raw_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_description_raw_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_description_raw_data_id_seq OWNED BY tbim_description_raw_data.id;


--
-- Name: tbim_ganttdata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_ganttdata (
    id integer NOT NULL,
    duration interval NOT NULL,
    name text NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_data timestamp with time zone NOT NULL,
    "innerGuid" character varying(36) NOT NULL,
    "parentGuid" character varying(36),
    calculation_id integer NOT NULL
);


--
-- Name: tbim_ganttdata_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_ganttdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_ganttdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_ganttdata_id_seq OWNED BY tbim_ganttdata.id;


--
-- Name: tbim_geometryitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_geometryitem (
    id integer NOT NULL,
    geometry_type text NOT NULL,
    data text NOT NULL,
    bim_handle_id integer NOT NULL
);


--
-- Name: tbim_geometryitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_geometryitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_geometryitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_geometryitem_id_seq OWNED BY tbim_geometryitem.id;


--
-- Name: tbim_material; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_material (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: tbim_material_bim_handles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_material_bim_handles (
    id integer NOT NULL,
    material_id integer NOT NULL,
    bimhandle_id integer NOT NULL
);


--
-- Name: tbim_material_bim_handles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_material_bim_handles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_material_bim_handles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_material_bim_handles_id_seq OWNED BY tbim_material_bim_handles.id;


--
-- Name: tbim_material_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_material_id_seq OWNED BY tbim_material.id;


--
-- Name: tbim_material_structural_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_material_structural_data (
    id integer NOT NULL,
    material_id integer NOT NULL,
    rawdata_id integer NOT NULL
);


--
-- Name: tbim_material_structural_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_material_structural_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_material_structural_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_material_structural_data_id_seq OWNED BY tbim_material_structural_data.id;


--
-- Name: tbim_material_thermal_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_material_thermal_data (
    id integer NOT NULL,
    material_id integer NOT NULL,
    rawdata_id integer NOT NULL
);


--
-- Name: tbim_material_thermal_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_material_thermal_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_material_thermal_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_material_thermal_data_id_seq OWNED BY tbim_material_thermal_data.id;


--
-- Name: tbim_prediction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_prediction (
    id integer NOT NULL,
    confidence double precision NOT NULL,
    bim_handle_group_id integer NOT NULL,
    classification_id integer NOT NULL
);


--
-- Name: tbim_prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_prediction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_prediction_id_seq OWNED BY tbim_prediction.id;


--
-- Name: tbim_preliminaries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_preliminaries (
    id integer NOT NULL,
    extra_payment_name text NOT NULL,
    preliminary_name text NOT NULL,
    preliminary_value double precision,
    calculation_id integer NOT NULL
);


--
-- Name: tbim_preliminaries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_preliminaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_preliminaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_preliminaries_id_seq OWNED BY tbim_preliminaries.id;


--
-- Name: tbim_projectresourcetemplates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_projectresourcetemplates (
    id integer NOT NULL,
    resource_value_a integer NOT NULL,
    resource_value_b integer NOT NULL,
    resource_value_c integer NOT NULL,
    is_selected boolean NOT NULL,
    bim_document_id integer NOT NULL,
    resource_template_id integer NOT NULL
);


--
-- Name: tbim_projectresourcetemplates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_projectresourcetemplates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_projectresourcetemplates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_projectresourcetemplates_id_seq OWNED BY tbim_projectresourcetemplates.id;


--
-- Name: tbim_rawdata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_rawdata (
    id integer NOT NULL,
    key text NOT NULL,
    storage_type text NOT NULL,
    double_value double precision NOT NULL,
    string_value text NOT NULL,
    integer_value integer NOT NULL
);


--
-- Name: tbim_rawdata_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_rawdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_rawdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_rawdata_id_seq OWNED BY tbim_rawdata.id;


--
-- Name: tbim_resourcelimitations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_resourcelimitations (
    id integer NOT NULL,
    number double precision NOT NULL,
    bim_document_id integer NOT NULL,
    resource_id integer NOT NULL
);


--
-- Name: tbim_resourcelimitations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_resourcelimitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_resourcelimitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_resourcelimitations_id_seq OWNED BY tbim_resourcelimitations.id;


--
-- Name: tbim_resourcetemplates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_resourcetemplates (
    id integer NOT NULL,
    name text NOT NULL,
    created_by_id integer,
    resource_type_a_id integer NOT NULL,
    resource_type_b_id integer NOT NULL,
    resource_type_c_id integer NOT NULL
);


--
-- Name: tbim_resourcetemplates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_resourcetemplates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_resourcetemplates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_resourcetemplates_id_seq OWNED BY tbim_resourcetemplates.id;


--
-- Name: tbim_resourcetypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_resourcetypes (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: tbim_resourcetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_resourcetypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_resourcetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_resourcetypes_id_seq OWNED BY tbim_resourcetypes.id;


--
-- Name: tbim_scenario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbim_scenario (
    id integer NOT NULL,
    scenario_guid character varying(36) NOT NULL,
    name text NOT NULL,
    is_activated boolean NOT NULL,
    bim_document_id integer NOT NULL
);


--
-- Name: tbim_scenario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbim_scenario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbim_scenario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbim_scenario_id_seq OWNED BY tbim_scenario.id;


--
-- Name: thermal_data_map; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE thermal_data_map (
    material_id integer,
    raw_data_id integer
);


--
-- Name: tplan_country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tplan_country (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: tplan_country_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tplan_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tplan_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tplan_country_id_seq OWNED BY tplan_country.id;


--
-- Name: tplan_region; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tplan_region (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    country_id integer NOT NULL,
    rate double precision NOT NULL
);


--
-- Name: tplan_region_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tplan_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tplan_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tplan_region_id_seq OWNED BY tplan_region.id;


--
-- Name: tuser_invitation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tuser_invitation (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    refer_host character varying(30) NOT NULL,
    confirmation_key character varying(36) NOT NULL,
    is_verified boolean NOT NULL,
    invitation_time timestamp with time zone NOT NULL,
    inviter_id integer NOT NULL,
    work_package_id integer NOT NULL
);


--
-- Name: tuser_invitation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tuser_invitation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tuser_invitation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tuser_invitation_id_seq OWNED BY tuser_invitation.id;


--
-- Name: tuser_myuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tuser_myuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    role character varying(2) NOT NULL,
    refer_host character varying(30) NOT NULL,
    is_verified boolean NOT NULL,
    verification_key character varying(36),
    email character varying(254),
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL
);


--
-- Name: tuser_myuser_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tuser_myuser_groups (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: tuser_myuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tuser_myuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tuser_myuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tuser_myuser_groups_id_seq OWNED BY tuser_myuser_groups.id;


--
-- Name: tuser_myuser_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tuser_myuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tuser_myuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tuser_myuser_id_seq OWNED BY tuser_myuser.id;


--
-- Name: tuser_myuser_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tuser_myuser_user_permissions (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: tuser_myuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tuser_myuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tuser_myuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tuser_myuser_user_permissions_id_seq OWNED BY tuser_myuser_user_permissions.id;


--
-- Name: tuser_notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tuser_notification (
    id integer NOT NULL,
    message text NOT NULL,
    type character varying(2) NOT NULL,
    is_shown boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: tuser_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tuser_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tuser_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tuser_notification_id_seq OWNED BY tuser_notification.id;


--
-- Name: twork_cost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_cost (
    id integer NOT NULL,
    bare_daily double precision,
    labor_hour_bare double precision,
    labor_hour_incl_onp double precision,
    incl_onp_daily double precision,
    incl_onp_hourly double precision,
    bare_hourly double precision,
    vendor_id integer NOT NULL
);


--
-- Name: twork_cost_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_cost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_cost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_cost_id_seq OWNED BY twork_cost.id;


--
-- Name: twork_externalcodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_externalcodes (
    id integer NOT NULL,
    value text NOT NULL,
    type integer NOT NULL,
    resource_id integer NOT NULL
);


--
-- Name: twork_externalcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_externalcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_externalcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_externalcodes_id_seq OWNED BY twork_externalcodes.id;


--
-- Name: twork_extractor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_extractor (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: twork_extractor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_extractor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_extractor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_extractor_id_seq OWNED BY twork_extractor.id;


--
-- Name: twork_geopos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_geopos (
    id integer NOT NULL,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL,
    vendor_id integer NOT NULL
);


--
-- Name: twork_geopos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_geopos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_geopos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_geopos_id_seq OWNED BY twork_geopos.id;


--
-- Name: twork_resource; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_resource (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    tecode text NOT NULL,
    type_id integer NOT NULL
);


--
-- Name: twork_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_resource_id_seq OWNED BY twork_resource.id;


--
-- Name: twork_resourcetype; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_resourcetype (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: twork_resourcetype_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_resourcetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_resourcetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_resourcetype_id_seq OWNED BY twork_resourcetype.id;


--
-- Name: twork_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_tag (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: twork_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_tag_id_seq OWNED BY twork_tag.id;


--
-- Name: twork_vendors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_vendors (
    id integer NOT NULL,
    vendor_id text NOT NULL,
    shipment_time double precision NOT NULL,
    resource_id integer NOT NULL
);


--
-- Name: twork_vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_vendors_id_seq OWNED BY twork_vendors.id;


--
-- Name: twork_work; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_work (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    description text NOT NULL
);


--
-- Name: twork_work_extractors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_work_extractors (
    id integer NOT NULL,
    work_id integer NOT NULL,
    extractor_id integer NOT NULL
);


--
-- Name: twork_work_extractors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_work_extractors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_work_extractors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_work_extractors_id_seq OWNED BY twork_work_extractors.id;


--
-- Name: twork_work_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_work_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_work_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_work_id_seq OWNED BY twork_work.id;


--
-- Name: twork_work_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE twork_work_tags (
    id integer NOT NULL,
    work_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: twork_work_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twork_work_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twork_work_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twork_work_tags_id_seq OWNED BY twork_work_tags.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: bim_handle id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bim_handle ALTER COLUMN id SET DEFAULT nextval('bim_handle_id_seq'::regclass);


--
-- Name: description id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY description ALTER COLUMN id SET DEFAULT nextval('description_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: element_element id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY element_element ALTER COLUMN id SET DEFAULT nextval('element_element_id_seq'::regclass);


--
-- Name: element_uniclass id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY element_uniclass ALTER COLUMN id SET DEFAULT nextval('element_uniclass_id_seq'::regclass);


--
-- Name: geometry_item id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY geometry_item ALTER COLUMN id SET DEFAULT nextval('geometry_item_id_seq'::regclass);


--
-- Name: guardian_groupobjectpermission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: guardian_userobjectpermission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_userobjectpermission_id_seq'::regclass);


--
-- Name: material id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY material ALTER COLUMN id SET DEFAULT nextval('material_id_seq'::regclass);


--
-- Name: raw_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY raw_data ALTER COLUMN id SET DEFAULT nextval('raw_data_id_seq'::regclass);


--
-- Name: simple_email_confirmation_emailaddress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY simple_email_confirmation_emailaddress ALTER COLUMN id SET DEFAULT nextval('simple_email_confirmation_emailaddress_id_seq'::regclass);


--
-- Name: tbim_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_activity ALTER COLUMN id SET DEFAULT nextval('tbim_activity_id_seq'::regclass);


--
-- Name: tbim_activitygroup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_activitygroup ALTER COLUMN id SET DEFAULT nextval('tbim_activitygroup_id_seq'::regclass);


--
-- Name: tbim_bimdocument id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimdocument ALTER COLUMN id SET DEFAULT nextval('tbim_bimdocument_id_seq'::regclass);


--
-- Name: tbim_bimhandle id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimhandle ALTER COLUMN id SET DEFAULT nextval('tbim_bimhandle_id_seq'::regclass);


--
-- Name: tbim_bimhandlegroup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimhandlegroup ALTER COLUMN id SET DEFAULT nextval('tbim_bimhandlegroup_id_seq'::regclass);


--
-- Name: tbim_bimobject id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimobject ALTER COLUMN id SET DEFAULT nextval('tbim_bimobject_id_seq'::regclass);


--
-- Name: tbim_bimobject_bim_handles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimobject_bim_handles ALTER COLUMN id SET DEFAULT nextval('tbim_bimobject_bim_handles_id_seq'::regclass);


--
-- Name: tbim_bimrel id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimrel ALTER COLUMN id SET DEFAULT nextval('tbim_bimrel_id_seq'::regclass);


--
-- Name: tbim_calculation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_calculation ALTER COLUMN id SET DEFAULT nextval('tbim_calculation_id_seq'::regclass);


--
-- Name: tbim_constructioncost id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_constructioncost ALTER COLUMN id SET DEFAULT nextval('tbim_constructioncost_id_seq'::regclass);


--
-- Name: tbim_description id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description ALTER COLUMN id SET DEFAULT nextval('tbim_description_id_seq'::regclass);


--
-- Name: tbim_description_raw_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description_raw_data ALTER COLUMN id SET DEFAULT nextval('tbim_description_raw_data_id_seq'::regclass);


--
-- Name: tbim_ganttdata id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_ganttdata ALTER COLUMN id SET DEFAULT nextval('tbim_ganttdata_id_seq'::regclass);


--
-- Name: tbim_geometryitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_geometryitem ALTER COLUMN id SET DEFAULT nextval('tbim_geometryitem_id_seq'::regclass);


--
-- Name: tbim_material id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material ALTER COLUMN id SET DEFAULT nextval('tbim_material_id_seq'::regclass);


--
-- Name: tbim_material_bim_handles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_bim_handles ALTER COLUMN id SET DEFAULT nextval('tbim_material_bim_handles_id_seq'::regclass);


--
-- Name: tbim_material_structural_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_structural_data ALTER COLUMN id SET DEFAULT nextval('tbim_material_structural_data_id_seq'::regclass);


--
-- Name: tbim_material_thermal_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_thermal_data ALTER COLUMN id SET DEFAULT nextval('tbim_material_thermal_data_id_seq'::regclass);


--
-- Name: tbim_prediction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_prediction ALTER COLUMN id SET DEFAULT nextval('tbim_prediction_id_seq'::regclass);


--
-- Name: tbim_preliminaries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_preliminaries ALTER COLUMN id SET DEFAULT nextval('tbim_preliminaries_id_seq'::regclass);


--
-- Name: tbim_projectresourcetemplates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_projectresourcetemplates ALTER COLUMN id SET DEFAULT nextval('tbim_projectresourcetemplates_id_seq'::regclass);


--
-- Name: tbim_rawdata id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_rawdata ALTER COLUMN id SET DEFAULT nextval('tbim_rawdata_id_seq'::regclass);


--
-- Name: tbim_resourcelimitations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcelimitations ALTER COLUMN id SET DEFAULT nextval('tbim_resourcelimitations_id_seq'::regclass);


--
-- Name: tbim_resourcetemplates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcetemplates ALTER COLUMN id SET DEFAULT nextval('tbim_resourcetemplates_id_seq'::regclass);


--
-- Name: tbim_resourcetypes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcetypes ALTER COLUMN id SET DEFAULT nextval('tbim_resourcetypes_id_seq'::regclass);


--
-- Name: tbim_scenario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_scenario ALTER COLUMN id SET DEFAULT nextval('tbim_scenario_id_seq'::regclass);


--
-- Name: tplan_country id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tplan_country ALTER COLUMN id SET DEFAULT nextval('tplan_country_id_seq'::regclass);


--
-- Name: tplan_region id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tplan_region ALTER COLUMN id SET DEFAULT nextval('tplan_region_id_seq'::regclass);


--
-- Name: tuser_invitation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_invitation ALTER COLUMN id SET DEFAULT nextval('tuser_invitation_id_seq'::regclass);


--
-- Name: tuser_myuser id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser ALTER COLUMN id SET DEFAULT nextval('tuser_myuser_id_seq'::regclass);


--
-- Name: tuser_myuser_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser_groups ALTER COLUMN id SET DEFAULT nextval('tuser_myuser_groups_id_seq'::regclass);


--
-- Name: tuser_myuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('tuser_myuser_user_permissions_id_seq'::regclass);


--
-- Name: tuser_notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_notification ALTER COLUMN id SET DEFAULT nextval('tuser_notification_id_seq'::regclass);


--
-- Name: twork_cost id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_cost ALTER COLUMN id SET DEFAULT nextval('twork_cost_id_seq'::regclass);


--
-- Name: twork_externalcodes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_externalcodes ALTER COLUMN id SET DEFAULT nextval('twork_externalcodes_id_seq'::regclass);


--
-- Name: twork_extractor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_extractor ALTER COLUMN id SET DEFAULT nextval('twork_extractor_id_seq'::regclass);


--
-- Name: twork_geopos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_geopos ALTER COLUMN id SET DEFAULT nextval('twork_geopos_id_seq'::regclass);


--
-- Name: twork_resource id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_resource ALTER COLUMN id SET DEFAULT nextval('twork_resource_id_seq'::regclass);


--
-- Name: twork_resourcetype id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_resourcetype ALTER COLUMN id SET DEFAULT nextval('twork_resourcetype_id_seq'::regclass);


--
-- Name: twork_tag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_tag ALTER COLUMN id SET DEFAULT nextval('twork_tag_id_seq'::regclass);


--
-- Name: twork_vendors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_vendors ALTER COLUMN id SET DEFAULT nextval('twork_vendors_id_seq'::regclass);


--
-- Name: twork_work id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work ALTER COLUMN id SET DEFAULT nextval('twork_work_id_seq'::regclass);


--
-- Name: twork_work_extractors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work_extractors ALTER COLUMN id SET DEFAULT nextval('twork_work_extractors_id_seq'::regclass);


--
-- Name: twork_work_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work_tags ALTER COLUMN id SET DEFAULT nextval('twork_work_tags_id_seq'::regclass);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: bim_handle bim_handle_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bim_handle
    ADD CONSTRAINT bim_handle_pkey PRIMARY KEY (id);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY description
    ADD CONSTRAINT description_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: element_element element_element_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY element_element
    ADD CONSTRAINT element_element_pkey PRIMARY KEY (id);


--
-- Name: element_element element_element_system_id_product_id_317a1f6c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY element_element
    ADD CONSTRAINT element_element_system_id_product_id_317a1f6c_uniq UNIQUE (system_id, product_id);


--
-- Name: element_uniclass element_uniclass_code_description_table_51e1e385_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY element_uniclass
    ADD CONSTRAINT element_uniclass_code_description_table_51e1e385_uniq UNIQUE (code, description, "table");


--
-- Name: element_uniclass element_uniclass_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY element_uniclass
    ADD CONSTRAINT element_uniclass_pkey PRIMARY KEY (id);


--
-- Name: geometry_item geometry_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY geometry_item
    ADD CONSTRAINT geometry_item_pkey PRIMARY KEY (id);


--
-- Name: guardian_groupobjectpermission guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);


--
-- Name: guardian_userobjectpermission guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- Name: raw_data raw_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY raw_data
    ADD CONSTRAINT raw_data_pkey PRIMARY KEY (id);


--
-- Name: simple_email_confirmation_emailaddress simple_email_confirmatio_user_id_email_28a01714_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simple_email_confirmation_emailaddress
    ADD CONSTRAINT simple_email_confirmatio_user_id_email_28a01714_uniq UNIQUE (user_id, email);


--
-- Name: simple_email_confirmation_emailaddress simple_email_confirmation_emailaddress_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simple_email_confirmation_emailaddress
    ADD CONSTRAINT simple_email_confirmation_emailaddress_key_key UNIQUE (key);


--
-- Name: simple_email_confirmation_emailaddress simple_email_confirmation_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simple_email_confirmation_emailaddress
    ADD CONSTRAINT simple_email_confirmation_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: tbim_activity tbim_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_activity
    ADD CONSTRAINT tbim_activity_pkey PRIMARY KEY (id);


--
-- Name: tbim_activitygroup tbim_activitygroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_activitygroup
    ADD CONSTRAINT tbim_activitygroup_pkey PRIMARY KEY (id);


--
-- Name: tbim_bimdocument tbim_bimdocument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimdocument
    ADD CONSTRAINT tbim_bimdocument_pkey PRIMARY KEY (id);


--
-- Name: tbim_bimhandle tbim_bimhandle_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimhandle
    ADD CONSTRAINT tbim_bimhandle_pkey PRIMARY KEY (id);


--
-- Name: tbim_bimhandlegroup tbim_bimhandlegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimhandlegroup
    ADD CONSTRAINT tbim_bimhandlegroup_pkey PRIMARY KEY (id);


--
-- Name: tbim_bimobject_bim_handles tbim_bimobject_bim_handl_bimobject_id_bimhandle_i_bf8aac6e_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimobject_bim_handles
    ADD CONSTRAINT tbim_bimobject_bim_handl_bimobject_id_bimhandle_i_bf8aac6e_uniq UNIQUE (bimobject_id, bimhandle_id);


--
-- Name: tbim_bimobject_bim_handles tbim_bimobject_bim_handles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimobject_bim_handles
    ADD CONSTRAINT tbim_bimobject_bim_handles_pkey PRIMARY KEY (id);


--
-- Name: tbim_bimobject tbim_bimobject_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimobject
    ADD CONSTRAINT tbim_bimobject_pkey PRIMARY KEY (id);


--
-- Name: tbim_bimrel tbim_bimrel_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimrel
    ADD CONSTRAINT tbim_bimrel_pkey PRIMARY KEY (id);


--
-- Name: tbim_calculation tbim_calculation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_calculation
    ADD CONSTRAINT tbim_calculation_pkey PRIMARY KEY (id);


--
-- Name: tbim_constructioncost tbim_constructioncost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_constructioncost
    ADD CONSTRAINT tbim_constructioncost_pkey PRIMARY KEY (id);


--
-- Name: tbim_description tbim_description_bim_handle_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description
    ADD CONSTRAINT tbim_description_bim_handle_group_id_key UNIQUE (bim_handle_group_id);


--
-- Name: tbim_description tbim_description_bim_handle_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description
    ADD CONSTRAINT tbim_description_bim_handle_id_key UNIQUE (bim_handle_id);


--
-- Name: tbim_description tbim_description_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description
    ADD CONSTRAINT tbim_description_pkey PRIMARY KEY (id);


--
-- Name: tbim_description_raw_data tbim_description_raw_dat_description_id_rawdata_i_3456f259_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description_raw_data
    ADD CONSTRAINT tbim_description_raw_dat_description_id_rawdata_i_3456f259_uniq UNIQUE (description_id, rawdata_id);


--
-- Name: tbim_description_raw_data tbim_description_raw_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description_raw_data
    ADD CONSTRAINT tbim_description_raw_data_pkey PRIMARY KEY (id);


--
-- Name: tbim_ganttdata tbim_ganttdata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_ganttdata
    ADD CONSTRAINT tbim_ganttdata_pkey PRIMARY KEY (id);


--
-- Name: tbim_geometryitem tbim_geometryitem_bim_handle_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_geometryitem
    ADD CONSTRAINT tbim_geometryitem_bim_handle_id_key UNIQUE (bim_handle_id);


--
-- Name: tbim_geometryitem tbim_geometryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_geometryitem
    ADD CONSTRAINT tbim_geometryitem_pkey PRIMARY KEY (id);


--
-- Name: tbim_material_bim_handles tbim_material_bim_handle_material_id_bimhandle_id_1515a051_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_bim_handles
    ADD CONSTRAINT tbim_material_bim_handle_material_id_bimhandle_id_1515a051_uniq UNIQUE (material_id, bimhandle_id);


--
-- Name: tbim_material_bim_handles tbim_material_bim_handles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_bim_handles
    ADD CONSTRAINT tbim_material_bim_handles_pkey PRIMARY KEY (id);


--
-- Name: tbim_material tbim_material_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material
    ADD CONSTRAINT tbim_material_pkey PRIMARY KEY (id);


--
-- Name: tbim_material_structural_data tbim_material_structural_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_structural_data
    ADD CONSTRAINT tbim_material_structural_data_pkey PRIMARY KEY (id);


--
-- Name: tbim_material_structural_data tbim_material_structural_material_id_rawdata_id_72d5d92b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_structural_data
    ADD CONSTRAINT tbim_material_structural_material_id_rawdata_id_72d5d92b_uniq UNIQUE (material_id, rawdata_id);


--
-- Name: tbim_material_thermal_data tbim_material_thermal_data_material_id_rawdata_id_31fe9137_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_thermal_data
    ADD CONSTRAINT tbim_material_thermal_data_material_id_rawdata_id_31fe9137_uniq UNIQUE (material_id, rawdata_id);


--
-- Name: tbim_material_thermal_data tbim_material_thermal_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_thermal_data
    ADD CONSTRAINT tbim_material_thermal_data_pkey PRIMARY KEY (id);


--
-- Name: tbim_prediction tbim_prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_prediction
    ADD CONSTRAINT tbim_prediction_pkey PRIMARY KEY (id);


--
-- Name: tbim_preliminaries tbim_preliminaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_preliminaries
    ADD CONSTRAINT tbim_preliminaries_pkey PRIMARY KEY (id);


--
-- Name: tbim_projectresourcetemplates tbim_projectresourcetemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_projectresourcetemplates
    ADD CONSTRAINT tbim_projectresourcetemplates_pkey PRIMARY KEY (id);


--
-- Name: tbim_rawdata tbim_rawdata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_rawdata
    ADD CONSTRAINT tbim_rawdata_pkey PRIMARY KEY (id);


--
-- Name: tbim_resourcelimitations tbim_resourcelimitations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcelimitations
    ADD CONSTRAINT tbim_resourcelimitations_pkey PRIMARY KEY (id);


--
-- Name: tbim_resourcetemplates tbim_resourcetemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcetemplates
    ADD CONSTRAINT tbim_resourcetemplates_pkey PRIMARY KEY (id);


--
-- Name: tbim_resourcetypes tbim_resourcetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcetypes
    ADD CONSTRAINT tbim_resourcetypes_pkey PRIMARY KEY (id);


--
-- Name: tbim_scenario tbim_scenario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_scenario
    ADD CONSTRAINT tbim_scenario_pkey PRIMARY KEY (id);


--
-- Name: tplan_country tplan_country_name_06fb9eee_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tplan_country
    ADD CONSTRAINT tplan_country_name_06fb9eee_uniq UNIQUE (name);


--
-- Name: tplan_country tplan_country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tplan_country
    ADD CONSTRAINT tplan_country_pkey PRIMARY KEY (id);


--
-- Name: tplan_region tplan_region_name_country_id_a5953bb6_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tplan_region
    ADD CONSTRAINT tplan_region_name_country_id_a5953bb6_uniq UNIQUE (name, country_id);


--
-- Name: tplan_region tplan_region_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tplan_region
    ADD CONSTRAINT tplan_region_pkey PRIMARY KEY (id);


--
-- Name: tuser_invitation tuser_invitation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_invitation
    ADD CONSTRAINT tuser_invitation_pkey PRIMARY KEY (id);


--
-- Name: tuser_myuser tuser_myuser_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser
    ADD CONSTRAINT tuser_myuser_email_key UNIQUE (email);


--
-- Name: tuser_myuser_groups tuser_myuser_groups_myuser_id_group_id_298ad0fa_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser_groups
    ADD CONSTRAINT tuser_myuser_groups_myuser_id_group_id_298ad0fa_uniq UNIQUE (myuser_id, group_id);


--
-- Name: tuser_myuser_groups tuser_myuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser_groups
    ADD CONSTRAINT tuser_myuser_groups_pkey PRIMARY KEY (id);


--
-- Name: tuser_myuser tuser_myuser_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser
    ADD CONSTRAINT tuser_myuser_pkey PRIMARY KEY (id);


--
-- Name: tuser_myuser_user_permissions tuser_myuser_user_permis_myuser_id_permission_id_6c0d436a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser_user_permissions
    ADD CONSTRAINT tuser_myuser_user_permis_myuser_id_permission_id_6c0d436a_uniq UNIQUE (myuser_id, permission_id);


--
-- Name: tuser_myuser_user_permissions tuser_myuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser_user_permissions
    ADD CONSTRAINT tuser_myuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: tuser_notification tuser_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_notification
    ADD CONSTRAINT tuser_notification_pkey PRIMARY KEY (id);


--
-- Name: twork_cost twork_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_cost
    ADD CONSTRAINT twork_cost_pkey PRIMARY KEY (id);


--
-- Name: twork_externalcodes twork_externalcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_externalcodes
    ADD CONSTRAINT twork_externalcodes_pkey PRIMARY KEY (id);


--
-- Name: twork_extractor twork_extractor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_extractor
    ADD CONSTRAINT twork_extractor_pkey PRIMARY KEY (id);


--
-- Name: twork_geopos twork_geopos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_geopos
    ADD CONSTRAINT twork_geopos_pkey PRIMARY KEY (id);


--
-- Name: twork_resource twork_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_resource
    ADD CONSTRAINT twork_resource_pkey PRIMARY KEY (id);


--
-- Name: twork_resourcetype twork_resourcetype_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_resourcetype
    ADD CONSTRAINT twork_resourcetype_pkey PRIMARY KEY (id);


--
-- Name: twork_tag twork_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_tag
    ADD CONSTRAINT twork_tag_pkey PRIMARY KEY (id);


--
-- Name: twork_vendors twork_vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_vendors
    ADD CONSTRAINT twork_vendors_pkey PRIMARY KEY (id);


--
-- Name: twork_work_extractors twork_work_extractors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work_extractors
    ADD CONSTRAINT twork_work_extractors_pkey PRIMARY KEY (id);


--
-- Name: twork_work_extractors twork_work_extractors_work_id_extractor_id_aee2b47d_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work_extractors
    ADD CONSTRAINT twork_work_extractors_work_id_extractor_id_aee2b47d_uniq UNIQUE (work_id, extractor_id);


--
-- Name: twork_work twork_work_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work
    ADD CONSTRAINT twork_work_pkey PRIMARY KEY (id);


--
-- Name: twork_work_tags twork_work_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work_tags
    ADD CONSTRAINT twork_work_tags_pkey PRIMARY KEY (id);


--
-- Name: twork_work_tags twork_work_tags_work_id_tag_id_67d16519_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work_tags
    ADD CONSTRAINT twork_work_tags_work_id_tag_id_67d16519_uniq UNIQUE (work_id, tag_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: element_element_product_id_226cea83; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX element_element_product_id_226cea83 ON element_element USING btree (product_id);


--
-- Name: element_element_system_id_4534cd6b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX element_element_system_id_4534cd6b ON element_element USING btree (system_id);


--
-- Name: guardian_groupobjectpermission_content_type_id_7ade36b8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX guardian_groupobjectpermission_content_type_id_7ade36b8 ON guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_group_id_4bbbfb62; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX guardian_groupobjectpermission_group_id_4bbbfb62 ON guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_permission_id_36572738; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX guardian_groupobjectpermission_permission_id_36572738 ON guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_content_type_id_2e892405; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX guardian_userobjectpermission_content_type_id_2e892405 ON guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_permission_id_71807bfc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX guardian_userobjectpermission_permission_id_71807bfc ON guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_user_id_d5c1e964; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX guardian_userobjectpermission_user_id_d5c1e964 ON guardian_userobjectpermission USING btree (user_id);


--
-- Name: simple_email_confirmation_emailaddress_key_22d3e56e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX simple_email_confirmation_emailaddress_key_22d3e56e_like ON simple_email_confirmation_emailaddress USING btree (key varchar_pattern_ops);


--
-- Name: simple_email_confirmation_emailaddress_user_id_b0e04c62; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX simple_email_confirmation_emailaddress_user_id_b0e04c62 ON simple_email_confirmation_emailaddress USING btree (user_id);


--
-- Name: tbim_activity_activity_group_id_9d68750d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_activity_activity_group_id_9d68750d ON tbim_activity USING btree (activity_group_id);


--
-- Name: tbim_activity_bim_object_id_4b93e753; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_activity_bim_object_id_4b93e753 ON tbim_activity USING btree (bim_object_id);


--
-- Name: tbim_activity_calculation_id_5d98b5d9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_activity_calculation_id_5d98b5d9 ON tbim_activity USING btree (calculation_id);


--
-- Name: tbim_activitygroup_calculation_id_13101e4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_activitygroup_calculation_id_13101e4f ON tbim_activitygroup USING btree (calculation_id);


--
-- Name: tbim_bimdocument_owner_id_cc3c561e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimdocument_owner_id_cc3c561e ON tbim_bimdocument USING btree (owner_id);


--
-- Name: tbim_bimhandle_bim_document_id_d76fd6d8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimhandle_bim_document_id_d76fd6d8 ON tbim_bimhandle USING btree (bim_document_id);


--
-- Name: tbim_bimhandle_bim_handle_group_id_b411c434; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimhandle_bim_handle_group_id_b411c434 ON tbim_bimhandle USING btree (bim_handle_group_id);


--
-- Name: tbim_bimhandlegroup_bim_document_id_901c4e68; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimhandlegroup_bim_document_id_901c4e68 ON tbim_bimhandlegroup USING btree (bim_document_id);


--
-- Name: tbim_bimhandlegroup_predicted_classification_id_c5541901; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimhandlegroup_predicted_classification_id_c5541901 ON tbim_bimhandlegroup USING btree (predicted_classification_id);


--
-- Name: tbim_bimhandlegroup_user_classification_id_0ac1719a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimhandlegroup_user_classification_id_0ac1719a ON tbim_bimhandlegroup USING btree (user_classification_id);


--
-- Name: tbim_bimobject_bim_document_id_8c4a9a78; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimobject_bim_document_id_8c4a9a78 ON tbim_bimobject USING btree (bim_document_id);


--
-- Name: tbim_bimobject_bim_handles_bimhandle_id_5620ef2d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimobject_bim_handles_bimhandle_id_5620ef2d ON tbim_bimobject_bim_handles USING btree (bimhandle_id);


--
-- Name: tbim_bimobject_bim_handles_bimobject_id_96ce6ba9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimobject_bim_handles_bimobject_id_96ce6ba9 ON tbim_bimobject_bim_handles USING btree (bimobject_id);


--
-- Name: tbim_bimrel_main_id_ca6fd719; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimrel_main_id_ca6fd719 ON tbim_bimrel USING btree (main_id);


--
-- Name: tbim_bimrel_related_id_0caf8287; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_bimrel_related_id_0caf8287 ON tbim_bimrel USING btree (related_id);


--
-- Name: tbim_calculation_scenario_id_13969a98; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_calculation_scenario_id_13969a98 ON tbim_calculation USING btree (scenario_id);


--
-- Name: tbim_constructioncost_calculation_id_1b418ec9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_constructioncost_calculation_id_1b418ec9 ON tbim_constructioncost USING btree (calculation_id);


--
-- Name: tbim_description_raw_data_description_id_ce96f63f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_description_raw_data_description_id_ce96f63f ON tbim_description_raw_data USING btree (description_id);


--
-- Name: tbim_description_raw_data_rawdata_id_4e0a34ae; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_description_raw_data_rawdata_id_4e0a34ae ON tbim_description_raw_data USING btree (rawdata_id);


--
-- Name: tbim_ganttdata_calculation_id_3e618dc9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_ganttdata_calculation_id_3e618dc9 ON tbim_ganttdata USING btree (calculation_id);


--
-- Name: tbim_material_bim_handles_bimhandle_id_8a714f2e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_material_bim_handles_bimhandle_id_8a714f2e ON tbim_material_bim_handles USING btree (bimhandle_id);


--
-- Name: tbim_material_bim_handles_material_id_43bd373b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_material_bim_handles_material_id_43bd373b ON tbim_material_bim_handles USING btree (material_id);


--
-- Name: tbim_material_structural_data_material_id_98a80c07; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_material_structural_data_material_id_98a80c07 ON tbim_material_structural_data USING btree (material_id);


--
-- Name: tbim_material_structural_data_rawdata_id_1e6857c2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_material_structural_data_rawdata_id_1e6857c2 ON tbim_material_structural_data USING btree (rawdata_id);


--
-- Name: tbim_material_thermal_data_material_id_2af6c93f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_material_thermal_data_material_id_2af6c93f ON tbim_material_thermal_data USING btree (material_id);


--
-- Name: tbim_material_thermal_data_rawdata_id_fc677a12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_material_thermal_data_rawdata_id_fc677a12 ON tbim_material_thermal_data USING btree (rawdata_id);


--
-- Name: tbim_prediction_bim_handle_group_id_433b34c8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_prediction_bim_handle_group_id_433b34c8 ON tbim_prediction USING btree (bim_handle_group_id);


--
-- Name: tbim_prediction_classification_id_dc624ef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_prediction_classification_id_dc624ef6 ON tbim_prediction USING btree (classification_id);


--
-- Name: tbim_preliminaries_calculation_id_f74adda2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_preliminaries_calculation_id_f74adda2 ON tbim_preliminaries USING btree (calculation_id);


--
-- Name: tbim_projectresourcetemplates_bim_document_id_bfbd41bc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_projectresourcetemplates_bim_document_id_bfbd41bc ON tbim_projectresourcetemplates USING btree (bim_document_id);


--
-- Name: tbim_projectresourcetemplates_resource_template_id_afe858fc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_projectresourcetemplates_resource_template_id_afe858fc ON tbim_projectresourcetemplates USING btree (resource_template_id);


--
-- Name: tbim_resourcelimitations_bim_document_id_8baa2b2a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_resourcelimitations_bim_document_id_8baa2b2a ON tbim_resourcelimitations USING btree (bim_document_id);


--
-- Name: tbim_resourcelimitations_resource_id_b75c37a2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_resourcelimitations_resource_id_b75c37a2 ON tbim_resourcelimitations USING btree (resource_id);


--
-- Name: tbim_resourcetemplates_created_by_id_23aa8bf7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_resourcetemplates_created_by_id_23aa8bf7 ON tbim_resourcetemplates USING btree (created_by_id);


--
-- Name: tbim_resourcetemplates_resource_type_a_id_c0dd32f0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_resourcetemplates_resource_type_a_id_c0dd32f0 ON tbim_resourcetemplates USING btree (resource_type_a_id);


--
-- Name: tbim_resourcetemplates_resource_type_b_id_89d75a16; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_resourcetemplates_resource_type_b_id_89d75a16 ON tbim_resourcetemplates USING btree (resource_type_b_id);


--
-- Name: tbim_resourcetemplates_resource_type_c_id_94125361; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_resourcetemplates_resource_type_c_id_94125361 ON tbim_resourcetemplates USING btree (resource_type_c_id);


--
-- Name: tbim_scenario_bim_document_id_9fa5ab71; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tbim_scenario_bim_document_id_9fa5ab71 ON tbim_scenario USING btree (bim_document_id);


--
-- Name: tplan_region_country_id_ade436ba; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tplan_region_country_id_ade436ba ON tplan_region USING btree (country_id);


--
-- Name: tuser_invitation_inviter_id_0e73cc4a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tuser_invitation_inviter_id_0e73cc4a ON tuser_invitation USING btree (inviter_id);


--
-- Name: tuser_invitation_work_package_id_e3582171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tuser_invitation_work_package_id_e3582171 ON tuser_invitation USING btree (work_package_id);


--
-- Name: tuser_myuser_email_a06c8f60_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tuser_myuser_email_a06c8f60_like ON tuser_myuser USING btree (email varchar_pattern_ops);


--
-- Name: tuser_myuser_groups_group_id_192cf17d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tuser_myuser_groups_group_id_192cf17d ON tuser_myuser_groups USING btree (group_id);


--
-- Name: tuser_myuser_groups_myuser_id_17deb77b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tuser_myuser_groups_myuser_id_17deb77b ON tuser_myuser_groups USING btree (myuser_id);


--
-- Name: tuser_myuser_user_permissions_myuser_id_caa5751a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tuser_myuser_user_permissions_myuser_id_caa5751a ON tuser_myuser_user_permissions USING btree (myuser_id);


--
-- Name: tuser_myuser_user_permissions_permission_id_3cd9367a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tuser_myuser_user_permissions_permission_id_3cd9367a ON tuser_myuser_user_permissions USING btree (permission_id);


--
-- Name: tuser_notification_user_id_37901dd4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tuser_notification_user_id_37901dd4 ON tuser_notification USING btree (user_id);


--
-- Name: twork_cost_vendor_id_3eecd08d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX twork_cost_vendor_id_3eecd08d ON twork_cost USING btree (vendor_id);


--
-- Name: twork_externalcodes_resource_id_adef1cf1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX twork_externalcodes_resource_id_adef1cf1 ON twork_externalcodes USING btree (resource_id);


--
-- Name: twork_geopos_vendor_id_4d0ae597; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX twork_geopos_vendor_id_4d0ae597 ON twork_geopos USING btree (vendor_id);


--
-- Name: twork_resource_type_id_870a5de9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX twork_resource_type_id_870a5de9 ON twork_resource USING btree (type_id);


--
-- Name: twork_vendors_resource_id_c6836fef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX twork_vendors_resource_id_c6836fef ON twork_vendors USING btree (resource_id);


--
-- Name: twork_work_extractors_extractor_id_ca1d04a3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX twork_work_extractors_extractor_id_ca1d04a3 ON twork_work_extractors USING btree (extractor_id);


--
-- Name: twork_work_extractors_work_id_4adee718; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX twork_work_extractors_work_id_4adee718 ON twork_work_extractors USING btree (work_id);


--
-- Name: twork_work_tags_tag_id_b1d8f9aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX twork_work_tags_tag_id_b1d8f9aa ON twork_work_tags USING btree (tag_id);


--
-- Name: twork_work_tags_work_id_e528dee6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX twork_work_tags_work_id_e528dee6 ON twork_work_tags USING btree (work_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_tuser_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_tuser_myuser_id FOREIGN KEY (user_id) REFERENCES tuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bim_rel bim_rel_bimbocuments_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bim_rel
    ADD CONSTRAINT bim_rel_bimbocuments_id_fkey FOREIGN KEY (bimbocument_id) REFERENCES tbim_bimdocument(id);


--
-- Name: description_data_map description_data_map_description_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY description_data_map
    ADD CONSTRAINT description_data_map_description_id_fkey FOREIGN KEY (description_id) REFERENCES description(id);


--
-- Name: description_data_map description_data_map_raw_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY description_data_map
    ADD CONSTRAINT description_data_map_raw_data_id_fkey FOREIGN KEY (raw_data_id) REFERENCES raw_data(id);


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_tuser_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_tuser_myuser_id FOREIGN KEY (user_id) REFERENCES tuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: element_element element_element_product_id_226cea83_fk_element_uniclass_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY element_element
    ADD CONSTRAINT element_element_product_id_226cea83_fk_element_uniclass_id FOREIGN KEY (product_id) REFERENCES element_uniclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: element_element element_element_system_id_4534cd6b_fk_element_uniclass_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY element_element
    ADD CONSTRAINT element_element_system_id_4534cd6b_fk_element_uniclass_id FOREIGN KEY (system_id) REFERENCES element_uniclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: geometry_item geometry_item_bim_handle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY geometry_item
    ADD CONSTRAINT geometry_item_bim_handle_id_fkey FOREIGN KEY (bim_handle_id) REFERENCES bim_handle(id);


--
-- Name: guardian_groupobjectpermission guardian_groupobject_content_type_id_7ade36b8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_content_type_id_7ade36b8_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_group_id_4bbbfb62_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_group_id_4bbbfb62_fk_auth_grou FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_permission_id_36572738_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_permission_id_36572738_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_content_type_id_2e892405_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_content_type_id_2e892405_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_permission_id_71807bfc_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_permission_id_71807bfc_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_user_id_d5c1e964_fk_tuser_myu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_user_id_d5c1e964_fk_tuser_myu FOREIGN KEY (user_id) REFERENCES tuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: material_map material_map_bim_handle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY material_map
    ADD CONSTRAINT material_map_bim_handle_id_fkey FOREIGN KEY (bim_handle_id) REFERENCES bim_handle(id);


--
-- Name: material_map material_map_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY material_map
    ADD CONSTRAINT material_map_material_id_fkey FOREIGN KEY (material_id) REFERENCES material(id);


--
-- Name: simple_email_confirmation_emailaddress simple_email_confirm_user_id_b0e04c62_fk_tuser_myu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simple_email_confirmation_emailaddress
    ADD CONSTRAINT simple_email_confirm_user_id_b0e04c62_fk_tuser_myu FOREIGN KEY (user_id) REFERENCES tuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: structural_data_map structural_data_map_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY structural_data_map
    ADD CONSTRAINT structural_data_map_material_id_fkey FOREIGN KEY (material_id) REFERENCES material(id);


--
-- Name: structural_data_map structural_data_map_raw_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY structural_data_map
    ADD CONSTRAINT structural_data_map_raw_data_id_fkey FOREIGN KEY (raw_data_id) REFERENCES raw_data(id);


--
-- Name: tbim_activity tbim_activity_activity_group_id_9d68750d_fk_tbim_acti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_activity
    ADD CONSTRAINT tbim_activity_activity_group_id_9d68750d_fk_tbim_acti FOREIGN KEY (activity_group_id) REFERENCES tbim_activitygroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_activity tbim_activity_bim_object_id_4b93e753_fk_tbim_bimobject_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_activity
    ADD CONSTRAINT tbim_activity_bim_object_id_4b93e753_fk_tbim_bimobject_id FOREIGN KEY (bim_object_id) REFERENCES tbim_bimobject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_activity tbim_activity_calculation_id_5d98b5d9_fk_tbim_calculation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_activity
    ADD CONSTRAINT tbim_activity_calculation_id_5d98b5d9_fk_tbim_calculation_id FOREIGN KEY (calculation_id) REFERENCES tbim_calculation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_activitygroup tbim_activitygroup_calculation_id_13101e4f_fk_tbim_calc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_activitygroup
    ADD CONSTRAINT tbim_activitygroup_calculation_id_13101e4f_fk_tbim_calc FOREIGN KEY (calculation_id) REFERENCES tbim_calculation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimdocument tbim_bimdocument_owner_id_cc3c561e_fk_tuser_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimdocument
    ADD CONSTRAINT tbim_bimdocument_owner_id_cc3c561e_fk_tuser_myuser_id FOREIGN KEY (owner_id) REFERENCES tuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimhandle tbim_bimhandle_bim_document_id_d76fd6d8_fk_tbim_bimdocument_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimhandle
    ADD CONSTRAINT tbim_bimhandle_bim_document_id_d76fd6d8_fk_tbim_bimdocument_id FOREIGN KEY (bim_document_id) REFERENCES tbim_bimdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimhandle tbim_bimhandle_bim_handle_group_id_b411c434_fk_tbim_bimh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimhandle
    ADD CONSTRAINT tbim_bimhandle_bim_handle_group_id_b411c434_fk_tbim_bimh FOREIGN KEY (bim_handle_group_id) REFERENCES tbim_bimhandlegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimhandlegroup tbim_bimhandlegroup_bim_document_id_901c4e68_fk_tbim_bimd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimhandlegroup
    ADD CONSTRAINT tbim_bimhandlegroup_bim_document_id_901c4e68_fk_tbim_bimd FOREIGN KEY (bim_document_id) REFERENCES tbim_bimdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimhandlegroup tbim_bimhandlegroup_predicted_classifica_c5541901_fk_element_e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimhandlegroup
    ADD CONSTRAINT tbim_bimhandlegroup_predicted_classifica_c5541901_fk_element_e FOREIGN KEY (predicted_classification_id) REFERENCES element_element(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimhandlegroup tbim_bimhandlegroup_user_classification__0ac1719a_fk_element_e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimhandlegroup
    ADD CONSTRAINT tbim_bimhandlegroup_user_classification__0ac1719a_fk_element_e FOREIGN KEY (user_classification_id) REFERENCES element_element(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimobject tbim_bimobject_bim_document_id_8c4a9a78_fk_tbim_bimdocument_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimobject
    ADD CONSTRAINT tbim_bimobject_bim_document_id_8c4a9a78_fk_tbim_bimdocument_id FOREIGN KEY (bim_document_id) REFERENCES tbim_bimdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimobject_bim_handles tbim_bimobject_bim_h_bimhandle_id_5620ef2d_fk_tbim_bimh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimobject_bim_handles
    ADD CONSTRAINT tbim_bimobject_bim_h_bimhandle_id_5620ef2d_fk_tbim_bimh FOREIGN KEY (bimhandle_id) REFERENCES tbim_bimhandle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimobject_bim_handles tbim_bimobject_bim_h_bimobject_id_96ce6ba9_fk_tbim_bimo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimobject_bim_handles
    ADD CONSTRAINT tbim_bimobject_bim_h_bimobject_id_96ce6ba9_fk_tbim_bimo FOREIGN KEY (bimobject_id) REFERENCES tbim_bimobject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimrel tbim_bimrel_main_id_ca6fd719_fk_tbim_bimhandle_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimrel
    ADD CONSTRAINT tbim_bimrel_main_id_ca6fd719_fk_tbim_bimhandle_id FOREIGN KEY (main_id) REFERENCES tbim_bimhandle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_bimrel tbim_bimrel_related_id_0caf8287_fk_tbim_bimhandle_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_bimrel
    ADD CONSTRAINT tbim_bimrel_related_id_0caf8287_fk_tbim_bimhandle_id FOREIGN KEY (related_id) REFERENCES tbim_bimhandle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_calculation tbim_calculation_scenario_id_13969a98_fk_tbim_scenario_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_calculation
    ADD CONSTRAINT tbim_calculation_scenario_id_13969a98_fk_tbim_scenario_id FOREIGN KEY (scenario_id) REFERENCES tbim_scenario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_constructioncost tbim_constructioncos_calculation_id_1b418ec9_fk_tbim_calc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_constructioncost
    ADD CONSTRAINT tbim_constructioncos_calculation_id_1b418ec9_fk_tbim_calc FOREIGN KEY (calculation_id) REFERENCES tbim_calculation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_description tbim_description_bim_handle_group_id_825227ea_fk_tbim_bimh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description
    ADD CONSTRAINT tbim_description_bim_handle_group_id_825227ea_fk_tbim_bimh FOREIGN KEY (bim_handle_group_id) REFERENCES tbim_bimhandlegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_description tbim_description_bim_handle_id_b3947aee_fk_tbim_bimhandle_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description
    ADD CONSTRAINT tbim_description_bim_handle_id_b3947aee_fk_tbim_bimhandle_id FOREIGN KEY (bim_handle_id) REFERENCES tbim_bimhandle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_description_raw_data tbim_description_raw_description_id_ce96f63f_fk_tbim_desc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description_raw_data
    ADD CONSTRAINT tbim_description_raw_description_id_ce96f63f_fk_tbim_desc FOREIGN KEY (description_id) REFERENCES tbim_description(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_description_raw_data tbim_description_raw_rawdata_id_4e0a34ae_fk_tbim_rawd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_description_raw_data
    ADD CONSTRAINT tbim_description_raw_rawdata_id_4e0a34ae_fk_tbim_rawd FOREIGN KEY (rawdata_id) REFERENCES tbim_rawdata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_ganttdata tbim_ganttdata_calculation_id_3e618dc9_fk_tbim_calculation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_ganttdata
    ADD CONSTRAINT tbim_ganttdata_calculation_id_3e618dc9_fk_tbim_calculation_id FOREIGN KEY (calculation_id) REFERENCES tbim_calculation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_geometryitem tbim_geometryitem_bim_handle_id_7cd75cc3_fk_tbim_bimhandle_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_geometryitem
    ADD CONSTRAINT tbim_geometryitem_bim_handle_id_7cd75cc3_fk_tbim_bimhandle_id FOREIGN KEY (bim_handle_id) REFERENCES tbim_bimhandle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_material_bim_handles tbim_material_bim_ha_bimhandle_id_8a714f2e_fk_tbim_bimh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_bim_handles
    ADD CONSTRAINT tbim_material_bim_ha_bimhandle_id_8a714f2e_fk_tbim_bimh FOREIGN KEY (bimhandle_id) REFERENCES tbim_bimhandle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_material_bim_handles tbim_material_bim_ha_material_id_43bd373b_fk_tbim_mate; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_bim_handles
    ADD CONSTRAINT tbim_material_bim_ha_material_id_43bd373b_fk_tbim_mate FOREIGN KEY (material_id) REFERENCES tbim_material(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_material_structural_data tbim_material_struct_material_id_98a80c07_fk_tbim_mate; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_structural_data
    ADD CONSTRAINT tbim_material_struct_material_id_98a80c07_fk_tbim_mate FOREIGN KEY (material_id) REFERENCES tbim_material(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_material_structural_data tbim_material_struct_rawdata_id_1e6857c2_fk_tbim_rawd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_structural_data
    ADD CONSTRAINT tbim_material_struct_rawdata_id_1e6857c2_fk_tbim_rawd FOREIGN KEY (rawdata_id) REFERENCES tbim_rawdata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_material_thermal_data tbim_material_therma_material_id_2af6c93f_fk_tbim_mate; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_thermal_data
    ADD CONSTRAINT tbim_material_therma_material_id_2af6c93f_fk_tbim_mate FOREIGN KEY (material_id) REFERENCES tbim_material(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_material_thermal_data tbim_material_therma_rawdata_id_fc677a12_fk_tbim_rawd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_material_thermal_data
    ADD CONSTRAINT tbim_material_therma_rawdata_id_fc677a12_fk_tbim_rawd FOREIGN KEY (rawdata_id) REFERENCES tbim_rawdata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_prediction tbim_prediction_bim_handle_group_id_433b34c8_fk_tbim_bimh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_prediction
    ADD CONSTRAINT tbim_prediction_bim_handle_group_id_433b34c8_fk_tbim_bimh FOREIGN KEY (bim_handle_group_id) REFERENCES tbim_bimhandlegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_prediction tbim_prediction_classification_id_dc624ef6_fk_element_e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_prediction
    ADD CONSTRAINT tbim_prediction_classification_id_dc624ef6_fk_element_e FOREIGN KEY (classification_id) REFERENCES element_element(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_preliminaries tbim_preliminaries_calculation_id_f74adda2_fk_tbim_calc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_preliminaries
    ADD CONSTRAINT tbim_preliminaries_calculation_id_f74adda2_fk_tbim_calc FOREIGN KEY (calculation_id) REFERENCES tbim_calculation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_projectresourcetemplates tbim_projectresource_bim_document_id_bfbd41bc_fk_tbim_bimd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_projectresourcetemplates
    ADD CONSTRAINT tbim_projectresource_bim_document_id_bfbd41bc_fk_tbim_bimd FOREIGN KEY (bim_document_id) REFERENCES tbim_bimdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_projectresourcetemplates tbim_projectresource_resource_template_id_afe858fc_fk_tbim_reso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_projectresourcetemplates
    ADD CONSTRAINT tbim_projectresource_resource_template_id_afe858fc_fk_tbim_reso FOREIGN KEY (resource_template_id) REFERENCES tbim_resourcetemplates(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_resourcelimitations tbim_resourcelimitat_bim_document_id_8baa2b2a_fk_tbim_bimd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcelimitations
    ADD CONSTRAINT tbim_resourcelimitat_bim_document_id_8baa2b2a_fk_tbim_bimd FOREIGN KEY (bim_document_id) REFERENCES tbim_bimdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_resourcelimitations tbim_resourcelimitat_resource_id_b75c37a2_fk_twork_res; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcelimitations
    ADD CONSTRAINT tbim_resourcelimitat_resource_id_b75c37a2_fk_twork_res FOREIGN KEY (resource_id) REFERENCES twork_resource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_resourcetemplates tbim_resourcetemplat_created_by_id_23aa8bf7_fk_tuser_myu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcetemplates
    ADD CONSTRAINT tbim_resourcetemplat_created_by_id_23aa8bf7_fk_tuser_myu FOREIGN KEY (created_by_id) REFERENCES tuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_resourcetemplates tbim_resourcetemplat_resource_type_a_id_c0dd32f0_fk_tbim_reso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcetemplates
    ADD CONSTRAINT tbim_resourcetemplat_resource_type_a_id_c0dd32f0_fk_tbim_reso FOREIGN KEY (resource_type_a_id) REFERENCES tbim_resourcetypes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_resourcetemplates tbim_resourcetemplat_resource_type_b_id_89d75a16_fk_tbim_reso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcetemplates
    ADD CONSTRAINT tbim_resourcetemplat_resource_type_b_id_89d75a16_fk_tbim_reso FOREIGN KEY (resource_type_b_id) REFERENCES tbim_resourcetypes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_resourcetemplates tbim_resourcetemplat_resource_type_c_id_94125361_fk_tbim_reso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_resourcetemplates
    ADD CONSTRAINT tbim_resourcetemplat_resource_type_c_id_94125361_fk_tbim_reso FOREIGN KEY (resource_type_c_id) REFERENCES tbim_resourcetypes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbim_scenario tbim_scenario_bim_document_id_9fa5ab71_fk_tbim_bimdocument_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbim_scenario
    ADD CONSTRAINT tbim_scenario_bim_document_id_9fa5ab71_fk_tbim_bimdocument_id FOREIGN KEY (bim_document_id) REFERENCES tbim_bimdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: thermal_data_map thermal_data_map_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY thermal_data_map
    ADD CONSTRAINT thermal_data_map_material_id_fkey FOREIGN KEY (material_id) REFERENCES material(id);


--
-- Name: thermal_data_map thermal_data_map_raw_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY thermal_data_map
    ADD CONSTRAINT thermal_data_map_raw_data_id_fkey FOREIGN KEY (raw_data_id) REFERENCES raw_data(id);


--
-- Name: tplan_region tplan_region_country_id_ade436ba_fk_tplan_country_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tplan_region
    ADD CONSTRAINT tplan_region_country_id_ade436ba_fk_tplan_country_id FOREIGN KEY (country_id) REFERENCES tplan_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tuser_invitation tuser_invitation_inviter_id_0e73cc4a_fk_tuser_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_invitation
    ADD CONSTRAINT tuser_invitation_inviter_id_0e73cc4a_fk_tuser_myuser_id FOREIGN KEY (inviter_id) REFERENCES tuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tuser_invitation tuser_invitation_work_package_id_e3582171_fk_tbim_cons; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_invitation
    ADD CONSTRAINT tuser_invitation_work_package_id_e3582171_fk_tbim_cons FOREIGN KEY (work_package_id) REFERENCES tbim_constructioncost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tuser_myuser_groups tuser_myuser_groups_group_id_192cf17d_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser_groups
    ADD CONSTRAINT tuser_myuser_groups_group_id_192cf17d_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tuser_myuser_groups tuser_myuser_groups_myuser_id_17deb77b_fk_tuser_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser_groups
    ADD CONSTRAINT tuser_myuser_groups_myuser_id_17deb77b_fk_tuser_myuser_id FOREIGN KEY (myuser_id) REFERENCES tuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tuser_myuser_user_permissions tuser_myuser_user_pe_myuser_id_caa5751a_fk_tuser_myu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser_user_permissions
    ADD CONSTRAINT tuser_myuser_user_pe_myuser_id_caa5751a_fk_tuser_myu FOREIGN KEY (myuser_id) REFERENCES tuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tuser_myuser_user_permissions tuser_myuser_user_pe_permission_id_3cd9367a_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_myuser_user_permissions
    ADD CONSTRAINT tuser_myuser_user_pe_permission_id_3cd9367a_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tuser_notification tuser_notification_user_id_37901dd4_fk_tuser_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tuser_notification
    ADD CONSTRAINT tuser_notification_user_id_37901dd4_fk_tuser_myuser_id FOREIGN KEY (user_id) REFERENCES tuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twork_cost twork_cost_vendor_id_3eecd08d_fk_twork_vendors_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_cost
    ADD CONSTRAINT twork_cost_vendor_id_3eecd08d_fk_twork_vendors_id FOREIGN KEY (vendor_id) REFERENCES twork_vendors(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twork_externalcodes twork_externalcodes_resource_id_adef1cf1_fk_twork_resource_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_externalcodes
    ADD CONSTRAINT twork_externalcodes_resource_id_adef1cf1_fk_twork_resource_id FOREIGN KEY (resource_id) REFERENCES twork_resource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twork_geopos twork_geopos_vendor_id_4d0ae597_fk_twork_vendors_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_geopos
    ADD CONSTRAINT twork_geopos_vendor_id_4d0ae597_fk_twork_vendors_id FOREIGN KEY (vendor_id) REFERENCES twork_vendors(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twork_resource twork_resource_type_id_870a5de9_fk_twork_resourcetype_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_resource
    ADD CONSTRAINT twork_resource_type_id_870a5de9_fk_twork_resourcetype_id FOREIGN KEY (type_id) REFERENCES twork_resourcetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twork_vendors twork_vendors_resource_id_c6836fef_fk_twork_resource_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_vendors
    ADD CONSTRAINT twork_vendors_resource_id_c6836fef_fk_twork_resource_id FOREIGN KEY (resource_id) REFERENCES twork_resource(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twork_work_extractors twork_work_extractor_extractor_id_ca1d04a3_fk_twork_ext; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work_extractors
    ADD CONSTRAINT twork_work_extractor_extractor_id_ca1d04a3_fk_twork_ext FOREIGN KEY (extractor_id) REFERENCES twork_extractor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twork_work_extractors twork_work_extractors_work_id_4adee718_fk_twork_work_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work_extractors
    ADD CONSTRAINT twork_work_extractors_work_id_4adee718_fk_twork_work_id FOREIGN KEY (work_id) REFERENCES twork_work(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twork_work_tags twork_work_tags_tag_id_b1d8f9aa_fk_twork_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work_tags
    ADD CONSTRAINT twork_work_tags_tag_id_b1d8f9aa_fk_twork_tag_id FOREIGN KEY (tag_id) REFERENCES twork_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twork_work_tags twork_work_tags_work_id_e528dee6_fk_twork_work_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY twork_work_tags
    ADD CONSTRAINT twork_work_tags_work_id_e528dee6_fk_twork_work_id FOREIGN KEY (work_id) REFERENCES twork_work(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

