PGDMP     0                    v            hrm    9.6.1    10.1 �    |	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            }	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ~	           1262    27136    hrm    DATABASE     �   CREATE DATABASE hrm WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE hrm;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    27392 
   Department    TABLE     b   CREATE TABLE "Department" (
    "Id" uuid NOT NULL,
    "Name" character varying(256) NOT NULL
);
     DROP TABLE public."Department";
       public         postgres    false    3            �            1259    27407    Document    TABLE        CREATE TABLE "Document" (
    "Id" uuid NOT NULL,
    "NumberId" integer NOT NULL,
    "Date" timestamp without time zone,
    "LastUpdatedDate" timestamp without time zone,
    "Type" character varying(50) NOT NULL,
    "Name" character varying(256) NOT NULL,
    "AuthorId" uuid NOT NULL,
    "ManagerId" uuid,
    "Comment" character varying(1024),
    "Extensions" jsonb,
    "State" character varying(256) DEFAULT 'Draft'::character varying NOT NULL,
    "Amount" numeric DEFAULT (0)::numeric NOT NULL,
    "LastUpdatedEmployeeId" uuid
);
    DROP TABLE public."Document";
       public         postgres    false    3            �            1259    27418    DocumentFiles    TABLE     �   CREATE TABLE "DocumentFiles" (
    "Id" uuid NOT NULL,
    "DocumentId" uuid NOT NULL,
    "Token" character varying(50),
    "Name" character varying(256),
    "Size" integer
);
 #   DROP TABLE public."DocumentFiles";
       public         postgres    false    3            �            1259    27430    DocumentTransitionHistory    TABLE     �  CREATE TABLE "DocumentTransitionHistory" (
    "Id" uuid NOT NULL,
    "DocumentId" uuid NOT NULL,
    "EmployeeId" uuid,
    "AllowedToEmployeeNames" character varying(1024),
    "TransitionTime" timestamp without time zone,
    "Order" integer NOT NULL,
    "InitialState" character varying(256) NOT NULL,
    "DestinationState" character varying(256) NOT NULL,
    "Command" character varying(1024) NOT NULL
);
 /   DROP TABLE public."DocumentTransitionHistory";
       public         postgres    false    3            �            1259    27428 #   DocumentTransitionHistory_Order_seq    SEQUENCE     �   CREATE SEQUENCE "DocumentTransitionHistory_Order_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."DocumentTransitionHistory_Order_seq";
       public       postgres    false    3    217            �	           0    0 #   DocumentTransitionHistory_Order_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE "DocumentTransitionHistory_Order_seq" OWNED BY "DocumentTransitionHistory"."Order";
            public       postgres    false    216            �            1259    27405    Document_NumberId_seq    SEQUENCE     y   CREATE SEQUENCE "Document_NumberId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Document_NumberId_seq";
       public       postgres    false    3    214            �	           0    0    Document_NumberId_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "Document_NumberId_seq" OWNED BY "Document"."NumberId";
            public       postgres    false    213            �            1259    27451    Employee    TABLE     �  CREATE TABLE "Employee" (
    "Id" uuid NOT NULL,
    "FirstName" character varying(256) NOT NULL,
    "LastName" character varying(256),
    "MiddleName" character varying(256),
    "Name" character varying(256) NOT NULL,
    "NumberId" integer NOT NULL,
    "Email" character varying(256),
    "LocationId" uuid,
    "Groups" text,
    "DepartmentId" uuid,
    "Title" character varying(128),
    "SourceHire" character varying(50),
    "DateJoin" date,
    "SeatingLocation" character varying(50),
    "Type" character varying(50),
    "PhoneMobile" character varying(50),
    "PhoneWork" character varying(50),
    "OtherEmail" character varying(50),
    "BirthDate" date,
    "Skills" character varying(256),
    "Address" character varying(256),
    "State" character varying(50),
    "Rate" numeric,
    "Salary" numeric,
    "AverageTaxRate" double precision,
    "DateLeft" date,
    "IsLeft" boolean DEFAULT (0)::boolean NOT NULL,
    "Extensions" jsonb
);
    DROP TABLE public."Employee";
       public         postgres    false    3            �            1259    27471    EmployeeFiles    TABLE     �   CREATE TABLE "EmployeeFiles" (
    "Id" uuid NOT NULL,
    "EmployeeId" uuid NOT NULL,
    "Token" character varying(50),
    "Name" character varying(256),
    "Size" integer
);
 #   DROP TABLE public."EmployeeFiles";
       public         postgres    false    3            �            1259    27481    EmployeeSalary    TABLE     �   CREATE TABLE "EmployeeSalary" (
    "Id" uuid NOT NULL,
    "EmployeeId" uuid,
    "DateFrom" date,
    "DateTo" date,
    "Salary" numeric,
    "Rate" numeric,
    "AverageTaxRate" double precision
);
 $   DROP TABLE public."EmployeeSalary";
       public         postgres    false    3            �            1259    27449    Employee_NumberId_seq    SEQUENCE     y   CREATE SEQUENCE "Employee_NumberId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Employee_NumberId_seq";
       public       postgres    false    219    3            �	           0    0    Employee_NumberId_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "Employee_NumberId_seq" OWNED BY "Employee"."NumberId";
            public       postgres    false    218            �            1259    27494    InvitationLetter    TABLE     �   CREATE TABLE "InvitationLetter" (
    "Id" uuid NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "DateExpired" timestamp without time zone NOT NULL,
    "EmployeeId" uuid NOT NULL
);
 &   DROP TABLE public."InvitationLetter";
       public         postgres    false    3            �            1259    27397    Location    TABLE     �   CREATE TABLE "Location" (
    "Id" uuid NOT NULL,
    "Name" character varying(256) NOT NULL,
    "Phone" character varying(256) NOT NULL,
    "Address" character varying(256) NOT NULL
);
    DROP TABLE public."Location";
       public         postgres    false    3            �            1259    27207    WorkflowGlobalParameter    TABLE     �   CREATE TABLE "WorkflowGlobalParameter" (
    "Id" uuid NOT NULL,
    "Type" character varying(256) NOT NULL,
    "Name" character varying(256) NOT NULL,
    "Value" text NOT NULL
);
 -   DROP TABLE public."WorkflowGlobalParameter";
       public         postgres    false    3            �            1259    27137    WorkflowInbox    TABLE     x   CREATE TABLE "WorkflowInbox" (
    "Id" uuid NOT NULL,
    "ProcessId" uuid NOT NULL,
    "IdentityId" uuid NOT NULL
);
 #   DROP TABLE public."WorkflowInbox";
       public         postgres    false    3            �            1259    27144    WorkflowProcessInstance    TABLE     j  CREATE TABLE "WorkflowProcessInstance" (
    "Id" uuid NOT NULL,
    "StateName" character varying(256),
    "ActivityName" character varying(256) NOT NULL,
    "SchemeId" uuid NOT NULL,
    "PreviousState" character varying(256),
    "PreviousStateForDirect" character varying(256),
    "PreviousStateForReverse" character varying(256),
    "PreviousActivity" character varying(256),
    "PreviousActivityForDirect" character varying(256),
    "PreviousActivityForReverse" character varying(256),
    "IsDeterminingParametersChanged" boolean NOT NULL,
    "ParentProcessId" uuid,
    "RootProcessId" uuid NOT NULL
);
 -   DROP TABLE public."WorkflowProcessInstance";
       public         postgres    false    3            �            1259    27153 "   WorkflowProcessInstancePersistence    TABLE     �   CREATE TABLE "WorkflowProcessInstancePersistence" (
    "Id" uuid NOT NULL,
    "ProcessId" uuid NOT NULL,
    "ParameterName" character varying(256) NOT NULL,
    "Value" text NOT NULL
);
 8   DROP TABLE public."WorkflowProcessInstancePersistence";
       public         postgres    false    3            �            1259    27162    WorkflowProcessInstanceStatus    TABLE     �   CREATE TABLE "WorkflowProcessInstanceStatus" (
    "Id" uuid NOT NULL,
    "Status" smallint NOT NULL,
    "Lock" uuid NOT NULL
);
 3   DROP TABLE public."WorkflowProcessInstanceStatus";
       public         postgres    false    3            �            1259    27168    WorkflowProcessScheme    TABLE     �  CREATE TABLE "WorkflowProcessScheme" (
    "Id" uuid NOT NULL,
    "Scheme" text NOT NULL,
    "DefiningParameters" text NOT NULL,
    "DefiningParametersHash" character varying(1024) NOT NULL,
    "SchemeCode" character varying(256) NOT NULL,
    "IsObsolete" boolean NOT NULL,
    "RootSchemeCode" character varying(256),
    "RootSchemeId" uuid,
    "AllowedActivities" text,
    "StartingTransition" text
);
 +   DROP TABLE public."WorkflowProcessScheme";
       public         postgres    false    3            �            1259    27179    WorkflowProcessTimer    TABLE     �   CREATE TABLE "WorkflowProcessTimer" (
    "Id" uuid NOT NULL,
    "ProcessId" uuid NOT NULL,
    "Name" character varying(256) NOT NULL,
    "NextExecutionDateTime" timestamp without time zone NOT NULL,
    "Ignore" boolean NOT NULL
);
 *   DROP TABLE public."WorkflowProcessTimer";
       public         postgres    false    3            �            1259    27188     WorkflowProcessTransitionHistory    TABLE     S  CREATE TABLE "WorkflowProcessTransitionHistory" (
    "Id" uuid NOT NULL,
    "ProcessId" uuid NOT NULL,
    "ExecutorIdentityId" character varying(256),
    "ActorIdentityId" character varying(256),
    "FromActivityName" character varying(256) NOT NULL,
    "ToActivityName" character varying(256) NOT NULL,
    "ToStateName" character varying(256),
    "TransitionTime" timestamp without time zone NOT NULL,
    "TransitionClassifier" character varying(256) NOT NULL,
    "FromStateName" character varying(256),
    "TriggerName" character varying(256),
    "IsFinalised" boolean NOT NULL
);
 6   DROP TABLE public."WorkflowProcessTransitionHistory";
       public         postgres    false    3            �            1259    27199    WorkflowScheme    TABLE     j   CREATE TABLE "WorkflowScheme" (
    "Code" character varying(256) NOT NULL,
    "Scheme" text NOT NULL
);
 $   DROP TABLE public."WorkflowScheme";
       public         postgres    false    3            �            1259    27215    dwAppSettings    TABLE     Y  CREATE TABLE "dwAppSettings" (
    "Name" character varying(50) NOT NULL,
    "Value" character varying(1000) NOT NULL,
    "GroupName" character varying(50),
    "ParamName" character varying(1024) NOT NULL,
    "Order" integer,
    "EditorType" character varying(50) DEFAULT 0 NOT NULL,
    "IsHidden" boolean DEFAULT (0)::boolean NOT NULL
);
 #   DROP TABLE public."dwAppSettings";
       public         postgres    false    3            �            1259    27305    dwSecurityCredential    TABLE       CREATE TABLE "dwSecurityCredential" (
    "Id" uuid NOT NULL,
    "PasswordHash" character varying(128),
    "PasswordSalt" character varying(128),
    "SecurityUserId" uuid NOT NULL,
    "Login" character varying(256) NOT NULL,
    "AuthenticationType" smallint NOT NULL
);
 *   DROP TABLE public."dwSecurityCredential";
       public         postgres    false    3            �            1259    27234    dwSecurityGroup    TABLE     �   CREATE TABLE "dwSecurityGroup" (
    "Id" uuid NOT NULL,
    "Name" character varying(128) NOT NULL,
    "Comment" character varying(1000),
    "IsSyncWithDomainGroup" boolean DEFAULT (0)::boolean NOT NULL
);
 %   DROP TABLE public."dwSecurityGroup";
       public         postgres    false    3            �            1259    27348    dwSecurityGroupToSecurityRole    TABLE     �   CREATE TABLE "dwSecurityGroupToSecurityRole" (
    "Id" uuid NOT NULL,
    "SecurityRoleId" uuid NOT NULL,
    "SecurityGroupId" uuid NOT NULL
);
 3   DROP TABLE public."dwSecurityGroupToSecurityRole";
       public         postgres    false    3            �            1259    27363    dwSecurityGroupToSecurityUser    TABLE     �   CREATE TABLE "dwSecurityGroupToSecurityUser" (
    "Id" uuid NOT NULL,
    "SecurityUserId" uuid NOT NULL,
    "SecurityGroupId" uuid NOT NULL
);
 3   DROP TABLE public."dwSecurityGroupToSecurityUser";
       public         postgres    false    3            �            1259    27248    dwSecurityPermission    TABLE     �   CREATE TABLE "dwSecurityPermission" (
    "Id" uuid NOT NULL,
    "Code" character varying(128) NOT NULL,
    "Name" character varying(128),
    "GroupId" uuid NOT NULL
);
 *   DROP TABLE public."dwSecurityPermission";
       public         postgres    false    3            �            1259    27243    dwSecurityPermissionGroup    TABLE     �   CREATE TABLE "dwSecurityPermissionGroup" (
    "Id" uuid NOT NULL,
    "Name" character varying(128) NOT NULL,
    "Code" character varying(128) NOT NULL
);
 /   DROP TABLE public."dwSecurityPermissionGroup";
       public         postgres    false    3            �            1259    27258    dwSecurityRole    TABLE     �   CREATE TABLE "dwSecurityRole" (
    "Id" uuid NOT NULL,
    "Code" character varying(128) NOT NULL,
    "Name" character varying(128) NOT NULL,
    "Comment" character varying(1000),
    "DomainGroup" character varying(512)
);
 $   DROP TABLE public."dwSecurityRole";
       public         postgres    false    3            �            1259    27266 "   dwSecurityRoleToSecurityPermission    TABLE     �   CREATE TABLE "dwSecurityRoleToSecurityPermission" (
    "Id" uuid NOT NULL,
    "SecurityRoleId" uuid NOT NULL,
    "SecurityPermissionId" uuid NOT NULL,
    "AccessType" smallint DEFAULT 0 NOT NULL
);
 8   DROP TABLE public."dwSecurityRoleToSecurityPermission";
       public         postgres    false    3            �            1259    27282    dwSecurityUser    TABLE     �  CREATE TABLE "dwSecurityUser" (
    "Id" uuid NOT NULL,
    "Name" character varying(256) NOT NULL,
    "Email" character varying(256),
    "IsLocked" boolean DEFAULT (0)::boolean NOT NULL,
    "ExternalId" character varying(1024),
    "Timezone" character varying(256),
    "Localization" character varying(256),
    "DecimalSeparator" character(1),
    "PageSize" integer,
    "StartPage" character varying(256),
    "IsRTL" boolean DEFAULT (0)::boolean
);
 $   DROP TABLE public."dwSecurityUser";
       public         postgres    false    3            �            1259    27318    dwSecurityUserImpersonation    TABLE     �   CREATE TABLE "dwSecurityUserImpersonation" (
    "Id" uuid NOT NULL,
    "SecurityUserId" uuid NOT NULL,
    "ImpSecurityUserId" uuid NOT NULL,
    "DateFrom" timestamp without time zone NOT NULL,
    "DateTo" timestamp without time zone NOT NULL
);
 1   DROP TABLE public."dwSecurityUserImpersonation";
       public         postgres    false    3            �            1259    27292    dwSecurityUserState    TABLE     �   CREATE TABLE "dwSecurityUserState" (
    "Id" uuid NOT NULL,
    "SecurityUserId" uuid NOT NULL,
    "Key" character varying(256) NOT NULL,
    "Value" text NOT NULL
);
 )   DROP TABLE public."dwSecurityUserState";
       public         postgres    false    3            �            1259    27333    dwSecurityUserToSecurityRole    TABLE     �   CREATE TABLE "dwSecurityUserToSecurityRole" (
    "Id" uuid NOT NULL,
    "SecurityRoleId" uuid NOT NULL,
    "SecurityUserId" uuid NOT NULL
);
 2   DROP TABLE public."dwSecurityUserToSecurityRole";
       public         postgres    false    3            �            1259    27225    dwUploadedFiles    TABLE     �  CREATE TABLE "dwUploadedFiles" (
    "Id" uuid NOT NULL,
    "Data" bytea NOT NULL,
    "AttachmentLength" bigint NOT NULL,
    "Used" boolean DEFAULT (0)::boolean NOT NULL,
    "Name" character varying(1000) NOT NULL,
    "ContentType" character varying(255) NOT NULL,
    "CreatedBy" character varying(1024),
    "CreatedDate" timestamp without time zone,
    "UpdatedBy" character varying(1024),
    "UpdatedDate" timestamp without time zone,
    "Properties" text
);
 %   DROP TABLE public."dwUploadedFiles";
       public         postgres    false    3            �            1259    27387 !   dwV_Security_CheckPermissionGroup    VIEW     �  CREATE VIEW "dwV_Security_CheckPermissionGroup" AS
 SELECT sgtosr."SecurityGroupId",
    sp."Id" AS "PermissionId",
    spg."Code" AS "PermissionGroupCode",
    spg."Name" AS "PermissionGroupName",
    sp."Code" AS "PermissionCode",
    sp."Name" AS "PermissionName",
    max(srtosp."AccessType") AS "AccessType"
   FROM ((("dwSecurityPermission" sp
     JOIN "dwSecurityPermissionGroup" spg ON ((sp."GroupId" = spg."Id")))
     JOIN "dwSecurityRoleToSecurityPermission" srtosp ON ((srtosp."SecurityPermissionId" = sp."Id")))
     JOIN "dwSecurityGroupToSecurityRole" sgtosr ON ((sgtosr."SecurityRoleId" = srtosp."SecurityRoleId")))
  WHERE (srtosp."AccessType" <> 0)
  GROUP BY sgtosr."SecurityGroupId", sp."Id", spg."Code", spg."Name", sp."Code", sp."Name";
 6   DROP VIEW public."dwV_Security_CheckPermissionGroup";
       public       postgres    false    198    197    197    197    198    198    198    200    200    200    206    206    3            �            1259    27378    dwV_Security_UserRole    VIEW     +  CREATE VIEW "dwV_Security_UserRole" AS
 SELECT "dwSecurityUserToSecurityRole"."SecurityUserId" AS "UserId",
    "dwSecurityUserToSecurityRole"."SecurityRoleId" AS "RoleId"
   FROM "dwSecurityUserToSecurityRole"
UNION
 SELECT DISTINCT "dwSecurityGroupToSecurityUser"."SecurityUserId" AS "UserId",
    "dwSecurityGroupToSecurityRole"."SecurityRoleId" AS "RoleId"
   FROM ("dwSecurityGroupToSecurityRole"
     JOIN "dwSecurityGroupToSecurityUser" ON (("dwSecurityGroupToSecurityUser"."SecurityGroupId" = "dwSecurityGroupToSecurityRole"."SecurityGroupId")));
 *   DROP VIEW public."dwV_Security_UserRole";
       public       postgres    false    206    205    205    207    207    206    3            �            1259    27382     dwV_Security_CheckPermissionUser    VIEW       CREATE VIEW "dwV_Security_CheckPermissionUser" AS
 SELECT "dwV_Security_UserRole"."UserId",
    sp."Id" AS "PermissionId",
    spg."Code" AS "PermissionGroupCode",
    spg."Name" AS "PermissionGroupName",
    sp."Code" AS "PermissionCode",
    sp."Name" AS "PermissionName",
    max(srtosp."AccessType") AS "AccessType"
   FROM ((("dwSecurityPermission" sp
     JOIN "dwSecurityPermissionGroup" spg ON ((sp."GroupId" = spg."Id")))
     JOIN "dwSecurityRoleToSecurityPermission" srtosp ON ((srtosp."SecurityPermissionId" = sp."Id")))
     JOIN "dwV_Security_UserRole" ON (("dwV_Security_UserRole"."RoleId" = srtosp."SecurityRoleId")))
  WHERE (srtosp."AccessType" <> 0)
  GROUP BY "dwV_Security_UserRole"."UserId", sp."Id", spg."Code", spg."Name", sp."Code", sp."Name";
 5   DROP VIEW public."dwV_Security_CheckPermissionUser";
       public       postgres    false    200    200    198    198    198    198    197    197    197    208    208    200    3            v           2604    27410    Document NumberId    DEFAULT     n   ALTER TABLE ONLY "Document" ALTER COLUMN "NumberId" SET DEFAULT nextval('"Document_NumberId_seq"'::regclass);
 D   ALTER TABLE public."Document" ALTER COLUMN "NumberId" DROP DEFAULT;
       public       postgres    false    213    214    214            y           2604    27433    DocumentTransitionHistory Order    DEFAULT     �   ALTER TABLE ONLY "DocumentTransitionHistory" ALTER COLUMN "Order" SET DEFAULT nextval('"DocumentTransitionHistory_Order_seq"'::regclass);
 R   ALTER TABLE public."DocumentTransitionHistory" ALTER COLUMN "Order" DROP DEFAULT;
       public       postgres    false    217    216    217            z           2604    27454    Employee NumberId    DEFAULT     n   ALTER TABLE ONLY "Employee" ALTER COLUMN "NumberId" SET DEFAULT nextval('"Employee_NumberId_seq"'::regclass);
 D   ALTER TABLE public."Employee" ALTER COLUMN "NumberId" DROP DEFAULT;
       public       postgres    false    219    218    219            n	          0    27392 
   Department 
   TABLE DATA               -   COPY "Department" ("Id", "Name") FROM stdin;
    public       postgres    false    211   ��       q	          0    27407    Document 
   TABLE DATA               �   COPY "Document" ("Id", "NumberId", "Date", "LastUpdatedDate", "Type", "Name", "AuthorId", "ManagerId", "Comment", "Extensions", "State", "Amount", "LastUpdatedEmployeeId") FROM stdin;
    public       postgres    false    214   ��       r	          0    27418    DocumentFiles 
   TABLE DATA               O   COPY "DocumentFiles" ("Id", "DocumentId", "Token", "Name", "Size") FROM stdin;
    public       postgres    false    215   ��       t	          0    27430    DocumentTransitionHistory 
   TABLE DATA               �   COPY "DocumentTransitionHistory" ("Id", "DocumentId", "EmployeeId", "AllowedToEmployeeNames", "TransitionTime", "Order", "InitialState", "DestinationState", "Command") FROM stdin;
    public       postgres    false    217   �       v	          0    27451    Employee 
   TABLE DATA               j  COPY "Employee" ("Id", "FirstName", "LastName", "MiddleName", "Name", "NumberId", "Email", "LocationId", "Groups", "DepartmentId", "Title", "SourceHire", "DateJoin", "SeatingLocation", "Type", "PhoneMobile", "PhoneWork", "OtherEmail", "BirthDate", "Skills", "Address", "State", "Rate", "Salary", "AverageTaxRate", "DateLeft", "IsLeft", "Extensions") FROM stdin;
    public       postgres    false    219   "�       w	          0    27471    EmployeeFiles 
   TABLE DATA               O   COPY "EmployeeFiles" ("Id", "EmployeeId", "Token", "Name", "Size") FROM stdin;
    public       postgres    false    220   ��       x	          0    27481    EmployeeSalary 
   TABLE DATA               q   COPY "EmployeeSalary" ("Id", "EmployeeId", "DateFrom", "DateTo", "Salary", "Rate", "AverageTaxRate") FROM stdin;
    public       postgres    false    221   ��       y	          0    27494    InvitationLetter 
   TABLE DATA               P   COPY "InvitationLetter" ("Id", "Date", "DateExpired", "EmployeeId") FROM stdin;
    public       postgres    false    222   ��       o	          0    27397    Location 
   TABLE DATA               ?   COPY "Location" ("Id", "Name", "Phone", "Address") FROM stdin;
    public       postgres    false    212   �       _	          0    27207    WorkflowGlobalParameter 
   TABLE DATA               K   COPY "WorkflowGlobalParameter" ("Id", "Type", "Name", "Value") FROM stdin;
    public       postgres    false    193   u�       W	          0    27137    WorkflowInbox 
   TABLE DATA               C   COPY "WorkflowInbox" ("Id", "ProcessId", "IdentityId") FROM stdin;
    public       postgres    false    185   ��       X	          0    27144    WorkflowProcessInstance 
   TABLE DATA               6  COPY "WorkflowProcessInstance" ("Id", "StateName", "ActivityName", "SchemeId", "PreviousState", "PreviousStateForDirect", "PreviousStateForReverse", "PreviousActivity", "PreviousActivityForDirect", "PreviousActivityForReverse", "IsDeterminingParametersChanged", "ParentProcessId", "RootProcessId") FROM stdin;
    public       postgres    false    186   ��       Y	          0    27153 "   WorkflowProcessInstancePersistence 
   TABLE DATA               d   COPY "WorkflowProcessInstancePersistence" ("Id", "ProcessId", "ParameterName", "Value") FROM stdin;
    public       postgres    false    187   ��       Z	          0    27162    WorkflowProcessInstanceStatus 
   TABLE DATA               J   COPY "WorkflowProcessInstanceStatus" ("Id", "Status", "Lock") FROM stdin;
    public       postgres    false    188   ��       [	          0    27168    WorkflowProcessScheme 
   TABLE DATA               �   COPY "WorkflowProcessScheme" ("Id", "Scheme", "DefiningParameters", "DefiningParametersHash", "SchemeCode", "IsObsolete", "RootSchemeCode", "RootSchemeId", "AllowedActivities", "StartingTransition") FROM stdin;
    public       postgres    false    189   �       \	          0    27179    WorkflowProcessTimer 
   TABLE DATA               g   COPY "WorkflowProcessTimer" ("Id", "ProcessId", "Name", "NextExecutionDateTime", "Ignore") FROM stdin;
    public       postgres    false    190   #�       ]	          0    27188     WorkflowProcessTransitionHistory 
   TABLE DATA               �   COPY "WorkflowProcessTransitionHistory" ("Id", "ProcessId", "ExecutorIdentityId", "ActorIdentityId", "FromActivityName", "ToActivityName", "ToStateName", "TransitionTime", "TransitionClassifier", "FromStateName", "TriggerName", "IsFinalised") FROM stdin;
    public       postgres    false    191   @�       ^	          0    27199    WorkflowScheme 
   TABLE DATA               5   COPY "WorkflowScheme" ("Code", "Scheme") FROM stdin;
    public       postgres    false    192   ]�       `	          0    27215    dwAppSettings 
   TABLE DATA               p   COPY "dwAppSettings" ("Name", "Value", "GroupName", "ParamName", "Order", "EditorType", "IsHidden") FROM stdin;
    public       postgres    false    194   8�       i	          0    27305    dwSecurityCredential 
   TABLE DATA               �   COPY "dwSecurityCredential" ("Id", "PasswordHash", "PasswordSalt", "SecurityUserId", "Login", "AuthenticationType") FROM stdin;
    public       postgres    false    203   �       b	          0    27234    dwSecurityGroup 
   TABLE DATA               V   COPY "dwSecurityGroup" ("Id", "Name", "Comment", "IsSyncWithDomainGroup") FROM stdin;
    public       postgres    false    196   ��       l	          0    27348    dwSecurityGroupToSecurityRole 
   TABLE DATA               ]   COPY "dwSecurityGroupToSecurityRole" ("Id", "SecurityRoleId", "SecurityGroupId") FROM stdin;
    public       postgres    false    206   �       m	          0    27363    dwSecurityGroupToSecurityUser 
   TABLE DATA               ]   COPY "dwSecurityGroupToSecurityUser" ("Id", "SecurityUserId", "SecurityGroupId") FROM stdin;
    public       postgres    false    207   9�       d	          0    27248    dwSecurityPermission 
   TABLE DATA               J   COPY "dwSecurityPermission" ("Id", "Code", "Name", "GroupId") FROM stdin;
    public       postgres    false    198   V�       c	          0    27243    dwSecurityPermissionGroup 
   TABLE DATA               D   COPY "dwSecurityPermissionGroup" ("Id", "Name", "Code") FROM stdin;
    public       postgres    false    197   e�       e	          0    27258    dwSecurityRole 
   TABLE DATA               S   COPY "dwSecurityRole" ("Id", "Code", "Name", "Comment", "DomainGroup") FROM stdin;
    public       postgres    false    199   ��       f	          0    27266 "   dwSecurityRoleToSecurityPermission 
   TABLE DATA               u   COPY "dwSecurityRoleToSecurityPermission" ("Id", "SecurityRoleId", "SecurityPermissionId", "AccessType") FROM stdin;
    public       postgres    false    200   ��       g	          0    27282    dwSecurityUser 
   TABLE DATA               �   COPY "dwSecurityUser" ("Id", "Name", "Email", "IsLocked", "ExternalId", "Timezone", "Localization", "DecimalSeparator", "PageSize", "StartPage", "IsRTL") FROM stdin;
    public       postgres    false    201   V      j	          0    27318    dwSecurityUserImpersonation 
   TABLE DATA               s   COPY "dwSecurityUserImpersonation" ("Id", "SecurityUserId", "ImpSecurityUserId", "DateFrom", "DateTo") FROM stdin;
    public       postgres    false    204   �      h	          0    27292    dwSecurityUserState 
   TABLE DATA               P   COPY "dwSecurityUserState" ("Id", "SecurityUserId", "Key", "Value") FROM stdin;
    public       postgres    false    202   �      k	          0    27333    dwSecurityUserToSecurityRole 
   TABLE DATA               [   COPY "dwSecurityUserToSecurityRole" ("Id", "SecurityRoleId", "SecurityUserId") FROM stdin;
    public       postgres    false    205   �      a	          0    27225    dwUploadedFiles 
   TABLE DATA               �   COPY "dwUploadedFiles" ("Id", "Data", "AttachmentLength", "Used", "Name", "ContentType", "CreatedBy", "CreatedDate", "UpdatedBy", "UpdatedDate", "Properties") FROM stdin;
    public       postgres    false    195   �      �	           0    0 #   DocumentTransitionHistory_Order_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"DocumentTransitionHistory_Order_seq"', 1, false);
            public       postgres    false    216            �	           0    0    Document_NumberId_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('"Document_NumberId_seq"', 1, false);
            public       postgres    false    213            �	           0    0    Employee_NumberId_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('"Employee_NumberId_seq"', 10, true);
            public       postgres    false    218            �           2606    27396    Department Department_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY "Department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY ("Id");
 H   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_pkey";
       public         postgres    false    211            �           2606    27422     DocumentFiles DocumentFiles_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY "DocumentFiles"
    ADD CONSTRAINT "DocumentFiles_pkey" PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY public."DocumentFiles" DROP CONSTRAINT "DocumentFiles_pkey";
       public         postgres    false    215            �           2606    27438 8   DocumentTransitionHistory DocumentTransitionHistory_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY "DocumentTransitionHistory"
    ADD CONSTRAINT "DocumentTransitionHistory_pkey" PRIMARY KEY ("Id");
 f   ALTER TABLE ONLY public."DocumentTransitionHistory" DROP CONSTRAINT "DocumentTransitionHistory_pkey";
       public         postgres    false    217            �           2606    27417    Document Document_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY "Document"
    ADD CONSTRAINT "Document_pkey" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Document" DROP CONSTRAINT "Document_pkey";
       public         postgres    false    214            �           2606    27475     EmployeeFiles EmployeeFiles_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY "EmployeeFiles"
    ADD CONSTRAINT "EmployeeFiles_pkey" PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY public."EmployeeFiles" DROP CONSTRAINT "EmployeeFiles_pkey";
       public         postgres    false    220            �           2606    27488 "   EmployeeSalary EmployeeSalary_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "EmployeeSalary"
    ADD CONSTRAINT "EmployeeSalary_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."EmployeeSalary" DROP CONSTRAINT "EmployeeSalary_pkey";
       public         postgres    false    221            �           2606    27460    Employee Employee_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY "Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Employee" DROP CONSTRAINT "Employee_pkey";
       public         postgres    false    219            �           2606    27498 &   InvitationLetter InvitationLetter_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "InvitationLetter"
    ADD CONSTRAINT "InvitationLetter_pkey" PRIMARY KEY ("Id");
 T   ALTER TABLE ONLY public."InvitationLetter" DROP CONSTRAINT "InvitationLetter_pkey";
       public         postgres    false    222            �           2606    27404    Location Location_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY "Location"
    ADD CONSTRAINT "Location_pkey" PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."Location" DROP CONSTRAINT "Location_pkey";
       public         postgres    false    212            �           2606    27214 4   WorkflowGlobalParameter WorkflowGlobalParameter_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "WorkflowGlobalParameter"
    ADD CONSTRAINT "WorkflowGlobalParameter_pkey" PRIMARY KEY ("Id");
 b   ALTER TABLE ONLY public."WorkflowGlobalParameter" DROP CONSTRAINT "WorkflowGlobalParameter_pkey";
       public         postgres    false    193                       2606    27141     WorkflowInbox WorkflowInbox_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY "WorkflowInbox"
    ADD CONSTRAINT "WorkflowInbox_pkey" PRIMARY KEY ("Id");
 N   ALTER TABLE ONLY public."WorkflowInbox" DROP CONSTRAINT "WorkflowInbox_pkey";
       public         postgres    false    185            �           2606    27160 J   WorkflowProcessInstancePersistence WorkflowProcessInstancePersistence_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "WorkflowProcessInstancePersistence"
    ADD CONSTRAINT "WorkflowProcessInstancePersistence_pkey" PRIMARY KEY ("Id");
 x   ALTER TABLE ONLY public."WorkflowProcessInstancePersistence" DROP CONSTRAINT "WorkflowProcessInstancePersistence_pkey";
       public         postgres    false    187            �           2606    27166 @   WorkflowProcessInstanceStatus WorkflowProcessInstanceStatus_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "WorkflowProcessInstanceStatus"
    ADD CONSTRAINT "WorkflowProcessInstanceStatus_pkey" PRIMARY KEY ("Id");
 n   ALTER TABLE ONLY public."WorkflowProcessInstanceStatus" DROP CONSTRAINT "WorkflowProcessInstanceStatus_pkey";
       public         postgres    false    188            �           2606    27151 4   WorkflowProcessInstance WorkflowProcessInstance_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "WorkflowProcessInstance"
    ADD CONSTRAINT "WorkflowProcessInstance_pkey" PRIMARY KEY ("Id");
 b   ALTER TABLE ONLY public."WorkflowProcessInstance" DROP CONSTRAINT "WorkflowProcessInstance_pkey";
       public         postgres    false    186            �           2606    27175 0   WorkflowProcessScheme WorkflowProcessScheme_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "WorkflowProcessScheme"
    ADD CONSTRAINT "WorkflowProcessScheme_pkey" PRIMARY KEY ("Id");
 ^   ALTER TABLE ONLY public."WorkflowProcessScheme" DROP CONSTRAINT "WorkflowProcessScheme_pkey";
       public         postgres    false    189            �           2606    27183 .   WorkflowProcessTimer WorkflowProcessTimer_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY "WorkflowProcessTimer"
    ADD CONSTRAINT "WorkflowProcessTimer_pkey" PRIMARY KEY ("Id");
 \   ALTER TABLE ONLY public."WorkflowProcessTimer" DROP CONSTRAINT "WorkflowProcessTimer_pkey";
       public         postgres    false    190            �           2606    27195 F   WorkflowProcessTransitionHistory WorkflowProcessTransitionHistory_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "WorkflowProcessTransitionHistory"
    ADD CONSTRAINT "WorkflowProcessTransitionHistory_pkey" PRIMARY KEY ("Id");
 t   ALTER TABLE ONLY public."WorkflowProcessTransitionHistory" DROP CONSTRAINT "WorkflowProcessTransitionHistory_pkey";
       public         postgres    false    191            �           2606    27206 "   WorkflowScheme WorkflowScheme_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "WorkflowScheme"
    ADD CONSTRAINT "WorkflowScheme_pkey" PRIMARY KEY ("Code");
 P   ALTER TABLE ONLY public."WorkflowScheme" DROP CONSTRAINT "WorkflowScheme_pkey";
       public         postgres    false    192            �           2606    27224     dwAppSettings dwAppSettings_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "dwAppSettings"
    ADD CONSTRAINT "dwAppSettings_pkey" PRIMARY KEY ("Name");
 N   ALTER TABLE ONLY public."dwAppSettings" DROP CONSTRAINT "dwAppSettings_pkey";
       public         postgres    false    194            �           2606    27312 .   dwSecurityCredential dwSecurityCredential_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY "dwSecurityCredential"
    ADD CONSTRAINT "dwSecurityCredential_pkey" PRIMARY KEY ("Id");
 \   ALTER TABLE ONLY public."dwSecurityCredential" DROP CONSTRAINT "dwSecurityCredential_pkey";
       public         postgres    false    203            �           2606    27352 @   dwSecurityGroupToSecurityRole dwSecurityGroupToSecurityRole_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "dwSecurityGroupToSecurityRole"
    ADD CONSTRAINT "dwSecurityGroupToSecurityRole_pkey" PRIMARY KEY ("Id");
 n   ALTER TABLE ONLY public."dwSecurityGroupToSecurityRole" DROP CONSTRAINT "dwSecurityGroupToSecurityRole_pkey";
       public         postgres    false    206            �           2606    27367 @   dwSecurityGroupToSecurityUser dwSecurityGroupToSecurityUser_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "dwSecurityGroupToSecurityUser"
    ADD CONSTRAINT "dwSecurityGroupToSecurityUser_pkey" PRIMARY KEY ("Id");
 n   ALTER TABLE ONLY public."dwSecurityGroupToSecurityUser" DROP CONSTRAINT "dwSecurityGroupToSecurityUser_pkey";
       public         postgres    false    207            �           2606    27242 $   dwSecurityGroup dwSecurityGroup_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "dwSecurityGroup"
    ADD CONSTRAINT "dwSecurityGroup_pkey" PRIMARY KEY ("Id");
 R   ALTER TABLE ONLY public."dwSecurityGroup" DROP CONSTRAINT "dwSecurityGroup_pkey";
       public         postgres    false    196            �           2606    27247 8   dwSecurityPermissionGroup dwSecurityPermissionGroup_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY "dwSecurityPermissionGroup"
    ADD CONSTRAINT "dwSecurityPermissionGroup_pkey" PRIMARY KEY ("Id");
 f   ALTER TABLE ONLY public."dwSecurityPermissionGroup" DROP CONSTRAINT "dwSecurityPermissionGroup_pkey";
       public         postgres    false    197            �           2606    27252 .   dwSecurityPermission dwSecurityPermission_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY "dwSecurityPermission"
    ADD CONSTRAINT "dwSecurityPermission_pkey" PRIMARY KEY ("Id");
 \   ALTER TABLE ONLY public."dwSecurityPermission" DROP CONSTRAINT "dwSecurityPermission_pkey";
       public         postgres    false    198            �           2606    27271 J   dwSecurityRoleToSecurityPermission dwSecurityRoleToSecurityPermission_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityRoleToSecurityPermission"
    ADD CONSTRAINT "dwSecurityRoleToSecurityPermission_pkey" PRIMARY KEY ("Id");
 x   ALTER TABLE ONLY public."dwSecurityRoleToSecurityPermission" DROP CONSTRAINT "dwSecurityRoleToSecurityPermission_pkey";
       public         postgres    false    200            �           2606    27265 "   dwSecurityRole dwSecurityRole_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "dwSecurityRole"
    ADD CONSTRAINT "dwSecurityRole_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."dwSecurityRole" DROP CONSTRAINT "dwSecurityRole_pkey";
       public         postgres    false    199            �           2606    27322 <   dwSecurityUserImpersonation dwSecurityUserImpersonation_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY "dwSecurityUserImpersonation"
    ADD CONSTRAINT "dwSecurityUserImpersonation_pkey" PRIMARY KEY ("Id");
 j   ALTER TABLE ONLY public."dwSecurityUserImpersonation" DROP CONSTRAINT "dwSecurityUserImpersonation_pkey";
       public         postgres    false    204            �           2606    27299 ,   dwSecurityUserState dwSecurityUserState_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY "dwSecurityUserState"
    ADD CONSTRAINT "dwSecurityUserState_pkey" PRIMARY KEY ("Id");
 Z   ALTER TABLE ONLY public."dwSecurityUserState" DROP CONSTRAINT "dwSecurityUserState_pkey";
       public         postgres    false    202            �           2606    27337 >   dwSecurityUserToSecurityRole dwSecurityUserToSecurityRole_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY "dwSecurityUserToSecurityRole"
    ADD CONSTRAINT "dwSecurityUserToSecurityRole_pkey" PRIMARY KEY ("Id");
 l   ALTER TABLE ONLY public."dwSecurityUserToSecurityRole" DROP CONSTRAINT "dwSecurityUserToSecurityRole_pkey";
       public         postgres    false    205            �           2606    27291 "   dwSecurityUser dwSecurityUser_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY "dwSecurityUser"
    ADD CONSTRAINT "dwSecurityUser_pkey" PRIMARY KEY ("Id");
 P   ALTER TABLE ONLY public."dwSecurityUser" DROP CONSTRAINT "dwSecurityUser_pkey";
       public         postgres    false    201            �           2606    27233 $   dwUploadedFiles dwUploadedFiles_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "dwUploadedFiles"
    ADD CONSTRAINT "dwUploadedFiles_pkey" PRIMARY KEY ("Id");
 R   ALTER TABLE ONLY public."dwUploadedFiles" DROP CONSTRAINT "dwUploadedFiles_pkey";
       public         postgres    false    195            |           1259    27142    WorkflowInbox_IdentityId_idx    INDEX     [   CREATE INDEX "WorkflowInbox_IdentityId_idx" ON "WorkflowInbox" USING btree ("IdentityId");
 2   DROP INDEX public."WorkflowInbox_IdentityId_idx";
       public         postgres    false    185            }           1259    27143    WorkflowInbox_ProcessId_idx    INDEX     Y   CREATE INDEX "WorkflowInbox_ProcessId_idx" ON "WorkflowInbox" USING btree ("ProcessId");
 1   DROP INDEX public."WorkflowInbox_ProcessId_idx";
       public         postgres    false    185            �           1259    27161 0   WorkflowProcessInstancePersistence_ProcessId_idx    INDEX     �   CREATE INDEX "WorkflowProcessInstancePersistence_ProcessId_idx" ON "WorkflowProcessInstancePersistence" USING btree ("ProcessId");
 F   DROP INDEX public."WorkflowProcessInstancePersistence_ProcessId_idx";
       public         postgres    false    187            �           1259    27167 (   WorkflowProcessInstanceStatus_Status_idx    INDEX     s   CREATE INDEX "WorkflowProcessInstanceStatus_Status_idx" ON "WorkflowProcessInstanceStatus" USING btree ("Status");
 >   DROP INDEX public."WorkflowProcessInstanceStatus_Status_idx";
       public         postgres    false    188            �           1259    27152 $   WorkflowProcessInstance_SchemeId_idx    INDEX     k   CREATE INDEX "WorkflowProcessInstance_SchemeId_idx" ON "WorkflowProcessInstance" USING btree ("SchemeId");
 :   DROP INDEX public."WorkflowProcessInstance_SchemeId_idx";
       public         postgres    false    186            �           1259    27176 0   WorkflowProcessScheme_DefiningParametersHash_idx    INDEX     �   CREATE INDEX "WorkflowProcessScheme_DefiningParametersHash_idx" ON "WorkflowProcessScheme" USING btree ("DefiningParametersHash");
 F   DROP INDEX public."WorkflowProcessScheme_DefiningParametersHash_idx";
       public         postgres    false    189            �           1259    27178 $   WorkflowProcessScheme_IsObsolete_idx    INDEX     k   CREATE INDEX "WorkflowProcessScheme_IsObsolete_idx" ON "WorkflowProcessScheme" USING btree ("IsObsolete");
 :   DROP INDEX public."WorkflowProcessScheme_IsObsolete_idx";
       public         postgres    false    189            �           1259    27177 $   WorkflowProcessScheme_SchemeCode_idx    INDEX     k   CREATE INDEX "WorkflowProcessScheme_SchemeCode_idx" ON "WorkflowProcessScheme" USING btree ("SchemeCode");
 :   DROP INDEX public."WorkflowProcessScheme_SchemeCode_idx";
       public         postgres    false    189            �           1259    27187    WorkflowProcessTimer_Ignore_idx    INDEX     a   CREATE INDEX "WorkflowProcessTimer_Ignore_idx" ON "WorkflowProcessTimer" USING btree ("Ignore");
 5   DROP INDEX public."WorkflowProcessTimer_Ignore_idx";
       public         postgres    false    190            �           1259    27185    WorkflowProcessTimer_Name_idx    INDEX     ]   CREATE INDEX "WorkflowProcessTimer_Name_idx" ON "WorkflowProcessTimer" USING btree ("Name");
 3   DROP INDEX public."WorkflowProcessTimer_Name_idx";
       public         postgres    false    190            �           1259    27186 .   WorkflowProcessTimer_NextExecutionDateTime_idx    INDEX        CREATE INDEX "WorkflowProcessTimer_NextExecutionDateTime_idx" ON "WorkflowProcessTimer" USING btree ("NextExecutionDateTime");
 D   DROP INDEX public."WorkflowProcessTimer_NextExecutionDateTime_idx";
       public         postgres    false    190            �           1259    27184 "   WorkflowProcessTimer_ProcessId_idx    INDEX     g   CREATE INDEX "WorkflowProcessTimer_ProcessId_idx" ON "WorkflowProcessTimer" USING btree ("ProcessId");
 8   DROP INDEX public."WorkflowProcessTimer_ProcessId_idx";
       public         postgres    false    190            �           1259    27198 4   WorkflowProcessTransitionHistory_ActorIdentityId_idx    INDEX     �   CREATE INDEX "WorkflowProcessTransitionHistory_ActorIdentityId_idx" ON "WorkflowProcessTransitionHistory" USING btree ("ActorIdentityId");
 J   DROP INDEX public."WorkflowProcessTransitionHistory_ActorIdentityId_idx";
       public         postgres    false    191            �           1259    27197 7   WorkflowProcessTransitionHistory_ExecutorIdentityId_idx    INDEX     �   CREATE INDEX "WorkflowProcessTransitionHistory_ExecutorIdentityId_idx" ON "WorkflowProcessTransitionHistory" USING btree ("ExecutorIdentityId");
 M   DROP INDEX public."WorkflowProcessTransitionHistory_ExecutorIdentityId_idx";
       public         postgres    false    191            �           1259    27196 .   WorkflowProcessTransitionHistory_ProcessId_idx    INDEX        CREATE INDEX "WorkflowProcessTransitionHistory_ProcessId_idx" ON "WorkflowProcessTransitionHistory" USING btree ("ProcessId");
 D   DROP INDEX public."WorkflowProcessTransitionHistory_ProcessId_idx";
       public         postgres    false    191            �           2606    27423 +   DocumentFiles DocumentFiles_DocumentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "DocumentFiles"
    ADD CONSTRAINT "DocumentFiles_DocumentId_fkey" FOREIGN KEY ("DocumentId") REFERENCES "Document"("Id") ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public."DocumentFiles" DROP CONSTRAINT "DocumentFiles_DocumentId_fkey";
       public       postgres    false    2238    214    215            �           2606    27439 C   DocumentTransitionHistory DocumentTransitionHistory_DocumentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "DocumentTransitionHistory"
    ADD CONSTRAINT "DocumentTransitionHistory_DocumentId_fkey" FOREIGN KEY ("DocumentId") REFERENCES "Document"("Id") ON DELETE CASCADE;
 q   ALTER TABLE ONLY public."DocumentTransitionHistory" DROP CONSTRAINT "DocumentTransitionHistory_DocumentId_fkey";
       public       postgres    false    217    2238    214            �           2606    27444 C   DocumentTransitionHistory DocumentTransitionHistory_EmployeeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "DocumentTransitionHistory"
    ADD CONSTRAINT "DocumentTransitionHistory_EmployeeId_fkey" FOREIGN KEY ("EmployeeId") REFERENCES "dwSecurityUser"("Id");
 q   ALTER TABLE ONLY public."DocumentTransitionHistory" DROP CONSTRAINT "DocumentTransitionHistory_EmployeeId_fkey";
       public       postgres    false    217    201    2220            �           2606    27476 +   EmployeeFiles EmployeeFiles_EmployeeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "EmployeeFiles"
    ADD CONSTRAINT "EmployeeFiles_EmployeeId_fkey" FOREIGN KEY ("EmployeeId") REFERENCES "Employee"("Id") ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public."EmployeeFiles" DROP CONSTRAINT "EmployeeFiles_EmployeeId_fkey";
       public       postgres    false    2244    219    220            �           2606    27489 -   EmployeeSalary EmployeeSalary_EmployeeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "EmployeeSalary"
    ADD CONSTRAINT "EmployeeSalary_EmployeeId_fkey" FOREIGN KEY ("EmployeeId") REFERENCES "Employee"("Id") ON DELETE CASCADE;
 [   ALTER TABLE ONLY public."EmployeeSalary" DROP CONSTRAINT "EmployeeSalary_EmployeeId_fkey";
       public       postgres    false    2244    221    219            �           2606    27466 #   Employee Employee_DepartmentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Employee"
    ADD CONSTRAINT "Employee_DepartmentId_fkey" FOREIGN KEY ("DepartmentId") REFERENCES "Department"("Id");
 Q   ALTER TABLE ONLY public."Employee" DROP CONSTRAINT "Employee_DepartmentId_fkey";
       public       postgres    false    2234    219    211            �           2606    27461 !   Employee Employee_LocationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Employee"
    ADD CONSTRAINT "Employee_LocationId_fkey" FOREIGN KEY ("LocationId") REFERENCES "Location"("Id");
 O   ALTER TABLE ONLY public."Employee" DROP CONSTRAINT "Employee_LocationId_fkey";
       public       postgres    false    212    219    2236            �           2606    27313 =   dwSecurityCredential dwSecurityCredential_SecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityCredential"
    ADD CONSTRAINT "dwSecurityCredential_SecurityUserId_fkey" FOREIGN KEY ("SecurityUserId") REFERENCES "dwSecurityUser"("Id") ON DELETE CASCADE;
 k   ALTER TABLE ONLY public."dwSecurityCredential" DROP CONSTRAINT "dwSecurityCredential_SecurityUserId_fkey";
       public       postgres    false    2220    203    201            �           2606    27358 P   dwSecurityGroupToSecurityRole dwSecurityGroupToSecurityRole_SecurityGroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityGroupToSecurityRole"
    ADD CONSTRAINT "dwSecurityGroupToSecurityRole_SecurityGroupId_fkey" FOREIGN KEY ("SecurityGroupId") REFERENCES "dwSecurityGroup"("Id");
 ~   ALTER TABLE ONLY public."dwSecurityGroupToSecurityRole" DROP CONSTRAINT "dwSecurityGroupToSecurityRole_SecurityGroupId_fkey";
       public       postgres    false    2210    206    196            �           2606    27353 O   dwSecurityGroupToSecurityRole dwSecurityGroupToSecurityRole_SecurityRoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityGroupToSecurityRole"
    ADD CONSTRAINT "dwSecurityGroupToSecurityRole_SecurityRoleId_fkey" FOREIGN KEY ("SecurityRoleId") REFERENCES "dwSecurityRole"("Id");
 }   ALTER TABLE ONLY public."dwSecurityGroupToSecurityRole" DROP CONSTRAINT "dwSecurityGroupToSecurityRole_SecurityRoleId_fkey";
       public       postgres    false    206    2216    199            �           2606    27373 P   dwSecurityGroupToSecurityUser dwSecurityGroupToSecurityUser_SecurityGroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityGroupToSecurityUser"
    ADD CONSTRAINT "dwSecurityGroupToSecurityUser_SecurityGroupId_fkey" FOREIGN KEY ("SecurityGroupId") REFERENCES "dwSecurityGroup"("Id");
 ~   ALTER TABLE ONLY public."dwSecurityGroupToSecurityUser" DROP CONSTRAINT "dwSecurityGroupToSecurityUser_SecurityGroupId_fkey";
       public       postgres    false    2210    196    207            �           2606    27368 O   dwSecurityGroupToSecurityUser dwSecurityGroupToSecurityUser_SecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityGroupToSecurityUser"
    ADD CONSTRAINT "dwSecurityGroupToSecurityUser_SecurityUserId_fkey" FOREIGN KEY ("SecurityUserId") REFERENCES "dwSecurityUser"("Id");
 }   ALTER TABLE ONLY public."dwSecurityGroupToSecurityUser" DROP CONSTRAINT "dwSecurityGroupToSecurityUser_SecurityUserId_fkey";
       public       postgres    false    207    201    2220            �           2606    27253 6   dwSecurityPermission dwSecurityPermission_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityPermission"
    ADD CONSTRAINT "dwSecurityPermission_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "dwSecurityPermissionGroup"("Id") ON DELETE CASCADE;
 d   ALTER TABLE ONLY public."dwSecurityPermission" DROP CONSTRAINT "dwSecurityPermission_GroupId_fkey";
       public       postgres    false    2212    197    198            �           2606    27277 _   dwSecurityRoleToSecurityPermission dwSecurityRoleToSecurityPermission_SecurityPermissionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityRoleToSecurityPermission"
    ADD CONSTRAINT "dwSecurityRoleToSecurityPermission_SecurityPermissionId_fkey" FOREIGN KEY ("SecurityPermissionId") REFERENCES "dwSecurityPermission"("Id") ON DELETE CASCADE;
 �   ALTER TABLE ONLY public."dwSecurityRoleToSecurityPermission" DROP CONSTRAINT "dwSecurityRoleToSecurityPermission_SecurityPermissionId_fkey";
       public       postgres    false    2214    200    198            �           2606    27272 Y   dwSecurityRoleToSecurityPermission dwSecurityRoleToSecurityPermission_SecurityRoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityRoleToSecurityPermission"
    ADD CONSTRAINT "dwSecurityRoleToSecurityPermission_SecurityRoleId_fkey" FOREIGN KEY ("SecurityRoleId") REFERENCES "dwSecurityRole"("Id");
 �   ALTER TABLE ONLY public."dwSecurityRoleToSecurityPermission" DROP CONSTRAINT "dwSecurityRoleToSecurityPermission_SecurityRoleId_fkey";
       public       postgres    false    200    2216    199            �           2606    27328 N   dwSecurityUserImpersonation dwSecurityUserImpersonation_ImpSecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityUserImpersonation"
    ADD CONSTRAINT "dwSecurityUserImpersonation_ImpSecurityUserId_fkey" FOREIGN KEY ("ImpSecurityUserId") REFERENCES "dwSecurityUser"("Id");
 |   ALTER TABLE ONLY public."dwSecurityUserImpersonation" DROP CONSTRAINT "dwSecurityUserImpersonation_ImpSecurityUserId_fkey";
       public       postgres    false    201    2220    204            �           2606    27323 K   dwSecurityUserImpersonation dwSecurityUserImpersonation_SecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityUserImpersonation"
    ADD CONSTRAINT "dwSecurityUserImpersonation_SecurityUserId_fkey" FOREIGN KEY ("SecurityUserId") REFERENCES "dwSecurityUser"("Id") ON DELETE CASCADE;
 y   ALTER TABLE ONLY public."dwSecurityUserImpersonation" DROP CONSTRAINT "dwSecurityUserImpersonation_SecurityUserId_fkey";
       public       postgres    false    2220    201    204            �           2606    27300 ;   dwSecurityUserState dwSecurityUserState_SecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityUserState"
    ADD CONSTRAINT "dwSecurityUserState_SecurityUserId_fkey" FOREIGN KEY ("SecurityUserId") REFERENCES "dwSecurityUser"("Id") ON DELETE CASCADE;
 i   ALTER TABLE ONLY public."dwSecurityUserState" DROP CONSTRAINT "dwSecurityUserState_SecurityUserId_fkey";
       public       postgres    false    2220    202    201            �           2606    27338 M   dwSecurityUserToSecurityRole dwSecurityUserToSecurityRole_SecurityRoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityUserToSecurityRole"
    ADD CONSTRAINT "dwSecurityUserToSecurityRole_SecurityRoleId_fkey" FOREIGN KEY ("SecurityRoleId") REFERENCES "dwSecurityRole"("Id");
 {   ALTER TABLE ONLY public."dwSecurityUserToSecurityRole" DROP CONSTRAINT "dwSecurityUserToSecurityRole_SecurityRoleId_fkey";
       public       postgres    false    199    205    2216            �           2606    27343 M   dwSecurityUserToSecurityRole dwSecurityUserToSecurityRole_SecurityUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "dwSecurityUserToSecurityRole"
    ADD CONSTRAINT "dwSecurityUserToSecurityRole_SecurityUserId_fkey" FOREIGN KEY ("SecurityUserId") REFERENCES "dwSecurityUser"("Id");
 {   ALTER TABLE ONLY public."dwSecurityUserToSecurityRole" DROP CONSTRAINT "dwSecurityUserToSecurityRole_SecurityUserId_fkey";
       public       postgres    false    201    2220    205            n	   �   x��=OC1E�_щ�(v�H,	V��vhE�^_��D,^�9���Q����c�qlX[\^��m����Qc6 16�Hq��{�Sc��_��;��[��=N$V�> d=����˻ݬmr<<�������.�������y<��e�U�i�hg�9�K��~��W���B2��i��m?��5o��h�<[���RA"�(�.O"����.�XI2 �Āx�R�2yҁ�K[^��a�$�>�s�^A      q	      x������ � �      r	      x������ � �      t	      x������ � �      v	   �  x�����1�k�S�(Ȗ�?�A�4IHw�,����f�����ˀ0�����at�l�b���j�X�R�TM����z/_����=�G�X�wߍ���$a�4�er�l�=C��c�*3|������v}����+�h""�y�9�X�(��x�u�J���������}��(Б4�*UH��M.m�G:4�ح�����4R>��2�@*e.�0��%XN��jx6{�u������߂I��Ii�/]z�5m����`	�~�����=�GRLչ\*��0�(z^Ê����YXo�Ӟ"�r$�N7���Xz�*�yDsn�s�o�iOA���lV0M�<*pM�Ǽ�;l����n�yO��I���˲U]��6�VU�X׏��{�OD��:����t�~ZJx      w	      x������ � �      x	      x������ � �      y	      x������ � �      o	   N  x�5��n�0E��W��BOKZ�M�����eQ���嶟_���{�8d�.9�����R�d,G��z-��x�loB'��W���#��{�J*F�~�<�L�yLJ�Ayi�h�.��͜�m�.��oC>��5��/<.u!j�Q�c�rן6�3��RΌ��	-�¨u�hbp�+v%��K͗*��u�3��_m����s4�F85����zCۘ����/���d�9�U�a�R��"M�d���9�"��k\W��e]Gx��J)�4�������E�aJmL	#��D�L��-��R��λ~9���3�T�Hx�hx�0�?���      _	      x������ � �      W	      x������ � �      X	      x������ � �      Y	      x������ � �      Z	      x������ � �      [	      x������ � �      \	      x������ � �      ]	      x������ � �      ^	   �  x��]mo�6���
� P�Nb��Vڽ���ۤJU\�5$�Izo��켿�!�I��8؎�<?��ձ4Y�#ֶ?=�gc��M���^t:�dik�N�+�������u竲AWݹc����Y8:���nL�� ��ʟ�!7�~k��_CY�P��_\T�nщ5q������#�r�+��#�$�!�G�-7S��\UMǰ��n%�M��Y/��A��A����Xg���E��y�ܒ˥�5c��<8xkZ�����,*
w�hz�6��PW��u��lG��?�n���r~�@��7��o��[�Nft�����@�9��U�U�-��zU��9�� 5C�z�{Y}�z챳��hvk�xj;��
�;�C�5�yn٧�'��+�0���{�TSt�B��܂[�p/o�ȵ���fռ�g.�7�AlW��ȋ�lu�R�5ӈ�G��L�}���
�� �rh��X1,����'��3��'���R���)����WW����UW�w;��F����yhe���%iig�"���� i���1�[d����V��|��ܒ6q����";�E6W@����C��hz(�̍_�p98��X��4,��~A��΂�	��Aa�~�{��Q=�IW���S����^5�-�?{�3�u���i�c7&���8d�e�jg�'�+��Y��1��_M|Ax��4%�����,���y��[�E������+��wغz7��^��WT�+	��CQzd<M[��/V�za��P'���EJS���G;���7�]���+77���4P,��W�7>���i\u�)�>Lj�Q��S�uL�(��p;���'=KJ�x)�"Φ��N��C�7���zc��z	�6�}	7��/�+��i/�Hu�V�ca$�[&�!1�8�L�;�q�������&�<
��V�<�l�pJm�H�<���yW`��ʼ�̞P�ӵ�dp��G�9��KW1ž���+j%�*��؆� l�WR������L#^r��k%�F5t�5nr�Mp�`�[0嶙��̹�0q2�FP�������e-2�-`�}���Z�ш�n·Έ�.i}�s�cb�C.��1&��������yf���`ę����L��(�l��5ܝ��`�P�=46H�:��f�w����osȔ_O���U�l������Wʹ���l!�DP��5J	���hs��fH\�n�a�X��<��<q���v0�<Q{i $O4R��`B�Úr���	@�' UH�h6��>!j���J3 �]����B
�@x{L'C
�8,�H�h���@6R a�@��A
ġ|k�]bl��|���))��^+�WQD�r� 2�4!1F=��w���<S��P��'���%������	�mw�*ږ�QQ{+ɻ��� O`�V����MS#�]�K����N0�%c*��\�hx��0%���I/�B���bG�]�$l@�$l@��)�S��@�F�ň�e�f��~�����N��Ȃ�_`TL?���u��3�E0�^��Z���T��Kz��`³���E�D���a���pm��N�lO��T".��A[ѵ��Ic��kfš�,Ɍ�|:�� ���-��ۖ�)3���+�dK��C0��[��c'2�H㢜�\m�RS�G�e (@ ʀS����e@}�2�(��A��#�=D�rl*��9�.@ ��?Q�i��Ԋ^I�G�5BQ���n���t���/^N�m������!^�pTV��������W�.y&Y� �7`�Qr�9в�~����p1x׶e��϶������M�X��� ����(� ����^�%
X~���������1�'E��������N1�����,���9����������Ȃ��0���N!��Bj��_���Oٶ����O⁄�H��C��2!U�_�P�ʏ]��O�9W&��O޵m�>�#h�@��~�Ꞟ��������      `	   �   x�m��� E�ӯ�L}�@��h|�؅7�:i���jB�2�p�]J��᎔,4��	Phݑ��Yt�dc=$���	�p�e�{��"����rt�a�D+`q��d�����`���_
C:@����BsC�����N�����skՐL�7�'����]�LA�ԯl�����<qA������(˲?���      i	   �  x�M��V*�@�寰�Md7` �J����$[D�K��囼ת�kǎ�0X$AxG 9M\t��̣���(�y��/K�w=l���x�|��9mM�ݞ(���<�Cl�W���jh���e�
₥$���#L�������w>��rND1D�19(7��ȓ�mg�}\�F��4��w��<��j�Ni��Cz{헏���q����I#�$!#��E鉥���Eǋ�>�p�:"�L&��؈^@kC���(�yJ,Y�X�cc,��s�{��X�S{��Te���~�_�N�+�`PVr�Z�6�)�d!!P�U"!J�ħ��11`Z������(�\J���"���#db�������b������?��7�����ޞƭb�a�ϙ:U�]y�i�6o����f:z�a�z�����F�u;�J5��Be&%�6!	φ8�9	��]0��>m�${�ٟe��L�����='���ڜo�����ב;����
I� ���#����,p��dq9�#C�1J��\��%R 8�h��4�P<�A�]��S�G��^��K�kN,e�n�y���6�}��L��H�6h�3�
��Kb=SN99o��9(�I���~���dO�G'Rq|�}��k��{����~�$���e9[�o�Cz���J�ʧU���)�\�����v]�S��)�~9r��m�:�-1�IDW���B]5}���`Sv��}����6;�R��~�4�|��Q��?���J����sÔ�[	�i��W�HؘHp����*�e�>�B2IBqV�����ýݞMo~���1Ӎ��v���+]U񴿞��vo������s=�hP�O$���HbO���8$r��Y��NY���)�@�j8�̄.�׋8/׽Fy�i[�w�`?ُ/�^��T���p���o�����|_w*��,=%�IL�ʌ�������:�
��ewv�3��������눃      b	      x������ � �      l	      x������ � �      m	      x������ � �      d	   �  x����jdG��>O�P��T����]�!�lT���n���a�>�����9-t���>U�VL�L���
2q���%b�����߿���do/�?�䯟�����\���\��w�.��L�A���֩Mm�]\�.��hC��`�U ��Ki��������Z#@��	B����Jݾi(<8x�6a��+�mS����z���<˫|�y?�
cA��Yb�E�/�)��A���S���E�"�&^ 	�I�Z��lte���xܧI�h�����[����;�r�����������L<^2���t~y?=��/�F����-7Yn��|ϣ
��|߻�$l1�ڎ䩡�qs��4��6dH��`�cw�uֹ��E7�.:ub���aQxm����'*I�!��FHb��,�FSo(�Ksr+�LZ�N�6��f�Eyv�7>�O��L�$��ʹV�����K�Apa��bq��B���W��y��,��ۀ5KϥWI���3T�f���z=4gH�����-��M�6�cp��]�a��cFs����g����]���9h� �e�y'`�k5�����f*��9�b��Uٴ]z^�xj	��劚����XUm���]�!���(�*�B�>G�/�e��F<v)��!�p����im�&D��{MB�z2?�*4�
�x4���������w)��¹Q�7���w�6���<�vӁ�4����p��D���\K��R������g9���.��;��_���o      c	   -  x�E��N1�ϛ�����$��.v� ��V�E��gU�s�|�y��2� �EA=��s�цʹ�O��q��\J�P�� �3
y�mj�ix�wӯ�M8��Qy��S��ih��XC�f����>t��ݕ3��fߡ��P�T���'�����[�����&\�L�s�,�C�#�J���Ҩ����:�_�١�|�+8\��k��ց�0h���(�֞�ώ��~��8�ˍ��i��!Ш��u/4hAՄ�����W�d$J�i5i�z2񡂭��BD�S���a9ݕ{{t���]�:      e	   F  x�]P�Nc1���
~`V��v	ڂ�-V��{l��D�f��$V�<g��C5Ŗ��"�H�'���F���r�o��v˚]R��*�5Y��!�pb[v�w�m;����g�5S
�C�����@�^�63\�[;��m��g��r��ۀA"��"g��Y�}y���v��4ǎ5��ѵ@�� �4
sN��(7f�|��U[�Y����.�$�H��u��{��x����L��[R0�`-@�`�"e�⚗ǿwO���S�[|�������f�á�jٱY:Ѿ�,�&�U�hX#x�6��0b�����e�_��_�~ ��>      f	   N  x����u,7E�չЇ8���!�|)' /|��V��&�ư���в� I-���5�:�H�����a��T~>NO�J�w��d�oּ���,;�%�3�Y�{��Y���"���=-�fa̶B�R�zl��d��R��i���1;NMڿ!5�˂��j[��4ӽW�t=,XFT�3�X���,��k�"}h�v<Ѻ�Pw�a��P2�Kw�<z����J̑}��yܾy͹R��}��,H!�ε���BT�"��8�f��O��0�Ubd/[O7��V��#ݽ{[�X0ʸ'��%J�{�YBʦ�z�9�wn�n	+��]��9�Sk���rd����Uz��h����6J�+3�Y�v�gc_	��]�Zm���N��^�Q�®t	����R&u�6>=z�M�4����N7�$'nYk��Nhm���r�ؼa�4h=Mr9���������L��z�������-�g_���N8���=�T-�������e�L�b\l��fo�&;��|CRj�9s�z�Rm��n
9[߻�|Vb|��˔���J��,��He�QR���v�s��%�����uƑ�+ifK��2�О�ImaNI�D��MiY�$��ó*'TY1�=���d�J��z�kp��J� �"<�O�ḺNI��u�B�����8B�0���	�jY��3Z�9� �S�R����	ٷ�c�p_��"��4zV��K��v��6�
 �ܜCUBi���8)����4{�bR%�L!e<�?<�4KZ'�շ�neM�xB�n]w�MN�=�F.8(�+E�Cm�Vq�ѻ���%���0e �H{TR4y?�)�:�C��8t~��f�ʴ[�'�p��Gm�rm1I(iQ��r�y<P+R�/rx|S��t��|�#�]�yա��ls���KnG���/'���7��j���|��`1	��AcJ/ϲ(ʂm�	{:��f@ߵkX�O*3��6BWFP�� �-ho{|%�T�>��{�Р8�й`i�q�����l#����[v�Ρq��y�A�c���ł��|���\͵��Qء�w�~��g�m���HSj�!�ln�����b���W�)X�=X!�Ν`+=��^�:���&\�A�< �,����P����K.u�6�	!��AE�]�4�� 0@S�9��z������K,V�ϕ�BX�YU�0��^�<��
)�Ɔ�|�=��S�W$x�����8c�y����|��P[i��(%MgI}λX!P�Db]� r�_�/�1�'O�F�Ll�������zJ���|u;���D�%�c�2�~��Q�h��g����t���|����g6�d!.���d�	���9S-2��^B��,��<�\��4yA��AQ1\�M��V�j�غ�p��{�����h���o|�Ƹ�I4<D%6"u2[���R�h�]F8�RfW�j8��+w�`�1����IDt��H3+'oO�a�@\co�c�7y9��T�R`��pxH����S%P��6�>.uR��.B!�eG�@�C���</g �-H����/qM#��� J��|'t�R����A��xLC�8�V'ഋ�>љ����wbJJ���!	���#����ɥNזw~3ϫ�KI��h~�0߂N�ϥ�Vо��y�A�aL�0W�yN�qz�|#��y�02
� c�	���r^�hK���aHC<���p�ӳ<����GD��FI���	��]� Ek���Kk�q Wa��JJ�	ߜ@N�j�v�\�Ҧw��1����G~X_�峞K�ǩ��K��o���!%���[A��$;��������@,}C���ޤʔ��Dʳ\'�R�ކ�߅��w��L�w���pT&+��,�	�N�`�^��p.8`d/��s|zhAW焖���
�)�]#�pa�ڋ܉�k�6��x���V���e��q�m����3�h�yPU�>��-�`R|��kc�#9��n���N�O�)^f�ｅ�@�A�|bq,�C�x�;��k���0��h�H�3�=�O�ѐo��򲅽ͯ;�R�8o��ݺ��Ԑ^��"� �.�X�d{G�_N��Uߨ������!�L�N�G{��ל\�6����f��c��gq,�U���R��I�O�S`���7�S�.c���C_\cr�#R�w;�g�|̞����b�-�S'�L����g��"ZY�S��͙�=��Â���6��|�\v[�-��v�YRY�&���z/JD��.h��8���73����ƴQRyX�{3�xPw]�T�|C�S�z��B�U=�O7�*8��K�S�`��CͭG��ozX���J5V\Pн)��ݓS�l9�ܛVN�F�b1H+וn����+=9�E�3��D1	,h����n��=L�:Ì��_~��E��[p�n�E>%���	PهCgIcB�S.�g|ÈUk��d&��C�������s����dhZ��*1��P���R�-Fox�P��^�.��F/a�1��wZ�<�O��k�{u��W���-:��h���*����,�W��T1��$�0�`���w��|��!��.�'|�8�qm��yB���$�<,P,j�6O����u��|���ᾘ�fR|%}7�/=�SrRh}9�i�%m�2k�T_��S&��INӊDq^}9��Fzj2&����Q�RD�u��y/ٝ%Eq5�<�<�Fyn�~+�}�3�9�p�؆aW�&o���1��FM�͸�|��+)z��.:�L��!m��18�S�|���(J<!c/Pp��
�%���ju�&:=�=������B��ۚ�ӗ:�S�X����G��3q�wGK��tzg��cX�
-��[�Wc�R'Q��Cy�������"��      g	   K  x����n[1E���0�DR� ��C�nY(�,2���+י��Ъ�s�Ĕ�3H��	AMq��;v�M���q�b{���C ��2A*:P�ý���r�α==�=���.���[_�L[n�0��H$Bфl����C��ۿ)wFsZ��d���,�e��V��� �+P�X�a�����nf���E��}�#�U'��|�̕H�;���x���综	�XE�0��`Ե1S%�Q�Io���p���� :ӵ��*��+��1	��J@���� #�U{Z��.l7�C�&�m�����K@�๯Iͽ��}����p�����      j	      x������ � �      h	      x������ � �      k	   �  x���A�� �ד��(��m��Gx�d1U�Ѥ���5x$���H9er#s7f�ҽ������Fj8�3�LG�bg��3m�X����fʊF�֪���=�����2H=:E!�*���T����v.��K�q��4��,�\����)r��Ť+6�E���#�n��������5o'�e4:�g����}\�j@�M���N�&�°��M��{�Iq�{ɂ�R��;�X�����y�a���� 6֡��P�|�Hsw�H)�R��eg|��{��[�  jk��.��m�OD�MC@�x�N.֩��Y���ɩ���s��/{�W-���1�5��G)�6]���i!�~�[�!��4�� [������'�����$���^?�c`${r���w�ט}��3��B^V�n���wŴZ�DuTCT@l	:����>=�ABk2�;����4�R�
[|?F勜s�$Y�42i��TcO君��܍��_jPx���{ryX=m��-��<��)Y6��(�޲��\C����	� Nq��;֍�s<��h�%�~Zj�Ξ�]9����#��;��>Sc�M��Z�9?��9��C\���۲ZX�'�>@aP��KYӭ��c�[�&w��~āՂ���;�z�����5�Au#�[G�`�������d�^[) }������B,��a�ľ�L1T��:�`�e6��+��ܿ��y�AR��      a	      x������ � �     