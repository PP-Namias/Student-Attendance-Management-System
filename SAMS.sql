PGDMP      :                |            SAMS    16.3    16.3 "    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16461    SAMS    DATABASE        CREATE DATABASE "SAMS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE "SAMS";
                postgres    false            �            1259    24752 
   Attendance    TABLE     K  CREATE TABLE public."Attendance" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "Course" text NOT NULL,
    "Year" text NOT NULL,
    "Section" text NOT NULL,
    "Status" text NOT NULL,
    "Archived" boolean NOT NULL,
    "Date" date NOT NULL,
    "StudentId" text NOT NULL,
    "Time" timestamp without time zone
);
     DROP TABLE public."Attendance";
       public         heap    postgres    false            �            1259    24757 	   LoginLogs    TABLE     ?  CREATE TABLE public."LoginLogs" (
    "Id" integer NOT NULL,
    "UserId" integer NOT NULL,
    "Username" text NOT NULL,
    "LogInTime" timestamp without time zone NOT NULL,
    "LogOutTime" timestamp without time zone,
    "Date" date NOT NULL,
    "Role" text NOT NULL,
    "Remark" text,
    "Archived" boolean
);
    DROP TABLE public."LoginLogs";
       public         heap    postgres    false            �            1259    24762 	   Students2    TABLE     �   CREATE TABLE public."Students2" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "Course" text NOT NULL,
    "Year" text NOT NULL,
    "Section" text NOT NULL,
    "StudentId" text NOT NULL,
    "Archived" boolean
);
    DROP TABLE public."Students2";
       public         heap    postgres    false            �            1259    24774    students_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.students_id_seq;
       public          postgres    false    217                       0    0    students_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.students_id_seq OWNED BY public."Students2"."Id";
          public          postgres    false    221            �            1259    24796    Students    TABLE     �   CREATE TABLE public."Students" (
    "Id" integer DEFAULT nextval('public.students_id_seq'::regclass) NOT NULL,
    "Name" text,
    "Course" text,
    "Year" text,
    "Section" text,
    "StudentId" text,
    "Archived" boolean
);
    DROP TABLE public."Students";
       public         heap    postgres    false    221            �            1259    24767    Users    TABLE     �   CREATE TABLE public."Users" (
    "Id" integer NOT NULL,
    "UserName" text NOT NULL,
    "PasswordHash" text NOT NULL,
    "PhoneNumber" text NOT NULL,
    "Role" text NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false            �            1259    24772    attendance_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.attendance_id_seq;
       public          postgres    false    215                       0    0    attendance_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.attendance_id_seq OWNED BY public."Attendance"."Id";
          public          postgres    false    219            �            1259    24773    loginlogs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.loginlogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.loginlogs_id_seq;
       public          postgres    false    216                       0    0    loginlogs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.loginlogs_id_seq OWNED BY public."LoginLogs"."Id";
          public          postgres    false    220            �            1259    24775    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    218                       0    0    users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.users_id_seq OWNED BY public."Users"."Id";
          public          postgres    false    222            c           2604    24776    Attendance Id    DEFAULT     r   ALTER TABLE ONLY public."Attendance" ALTER COLUMN "Id" SET DEFAULT nextval('public.attendance_id_seq'::regclass);
 @   ALTER TABLE public."Attendance" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    219    215            d           2604    24777    LoginLogs Id    DEFAULT     p   ALTER TABLE ONLY public."LoginLogs" ALTER COLUMN "Id" SET DEFAULT nextval('public.loginlogs_id_seq'::regclass);
 ?   ALTER TABLE public."LoginLogs" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    220    216            e           2604    24778    Students2 Id    DEFAULT     o   ALTER TABLE ONLY public."Students2" ALTER COLUMN "Id" SET DEFAULT nextval('public.students_id_seq'::regclass);
 ?   ALTER TABLE public."Students2" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    221    217            f           2604    24779    Users Id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN "Id" SET DEFAULT nextval('public.users_id_seq'::regclass);
 ;   ALTER TABLE public."Users" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    222    218            �          0    24752 
   Attendance 
   TABLE DATA           �   COPY public."Attendance" ("Id", "Name", "Course", "Year", "Section", "Status", "Archived", "Date", "StudentId", "Time") FROM stdin;
    public          postgres    false    215   &                  0    24757 	   LoginLogs 
   TABLE DATA           �   COPY public."LoginLogs" ("Id", "UserId", "Username", "LogInTime", "LogOutTime", "Date", "Role", "Remark", "Archived") FROM stdin;
    public          postgres    false    216   �'                 0    24796    Students 
   TABLE DATA           h   COPY public."Students" ("Id", "Name", "Course", "Year", "Section", "StudentId", "Archived") FROM stdin;
    public          postgres    false    223   �)                 0    24762 	   Students2 
   TABLE DATA           i   COPY public."Students2" ("Id", "Name", "Course", "Year", "Section", "StudentId", "Archived") FROM stdin;
    public          postgres    false    217   i*                 0    24767    Users 
   TABLE DATA           Z   COPY public."Users" ("Id", "UserName", "PasswordHash", "PhoneNumber", "Role") FROM stdin;
    public          postgres    false    218   R+                  0    0    attendance_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.attendance_id_seq', 16, true);
          public          postgres    false    219                       0    0    loginlogs_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.loginlogs_id_seq', 32, true);
          public          postgres    false    220                       0    0    students_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.students_id_seq', 8, true);
          public          postgres    false    221                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    222            m           2606    24789    Users Users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("Id");
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    218            i           2606    24781    Attendance attendance_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT attendance_pkey PRIMARY KEY ("Id");
 F   ALTER TABLE ONLY public."Attendance" DROP CONSTRAINT attendance_pkey;
       public            postgres    false    215            k           2606    24783    LoginLogs loginlogs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."LoginLogs"
    ADD CONSTRAINT loginlogs_pkey PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."LoginLogs" DROP CONSTRAINT loginlogs_pkey;
       public            postgres    false    216            o           2606    24802    Students students_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT students_pkey PRIMARY KEY ("Id");
 B   ALTER TABLE ONLY public."Students" DROP CONSTRAINT students_pkey;
       public            postgres    false    223            �   y  x����j1�����h�LN�ܩ��V��MЈ��º��O�T���-,쒅��� iM�l�`�P.�8�B�^c9���'�	I�ɨ��XTdNP�j
�D���B��2@�+�h���0��ݱ��:{_@�-A�5�N7 2�(�![��[l
֏E�l���i�{��F�z�P�(��-4��v�����m�tB֬�M�|��c�ֻko����m�2~7XgQ��*O[{yD�)U/rWE�.��HNUx�<.���Pd������r���Z�O�V�?��E�t�	��� �u�y0�9+1U/�9��n����C�-RP��t�o/6P�K��G�Fi�R���x�3�I<	��V^H.3��7O._{�yJǡ��R��|0          �  x���Mj1��=����_U�ΐC�.�����N�������!-5�@��O��{����rw~}>_�������₲  ��u(���������|�����������������<ڿ���\H
A�LL4�ۈ�=>GaM9��n����||�N��s!N�S=�I�FWM��Yo��-:B!+"�5��t���9q��c:�ޣ+�Ƈ�#��2�Go��	2D��x���@�D������|k��̦;�����yG;C~�V��=!;���SaK�W~'&gݩ�o�?��L���'�ؒ��-�T�@[]�*U�)�c"7iK�W���;�0�o)�ʷ�H,|����x�{���6���\�(�z�;	4�w梬���	�Q���&���N0ӟ������B����C�րY���x�]B��G�����c�ʯ��N�;�m�k}���L��J�5>ݦ���p��u�8         �   x���A�0���s 4Xu��D����	��QKR�FOo��6�����Sس�w�YcTgi\�ay� !J��xT�22t�<p�.����t��>Hf"Hk>�.M�_��5����$� ��2�O`A��m�����8�6:�	�tS��iZ�k�V/�g�7�$�&������P�A{���9�6�#gq��)+�c!��:[�         �   x�u�݊�0F�'O1Е6I�z�u�Ro�f�)jZbDv�~����3ߜ�ɡfϿ	V���`��b�]�	3���i�����P��3.�	n쑱�����L1}�t�ty�쎕�MQB+r���ear�"P0��
�Gl�+}��3�,�I��%���\u��5;6?��|�Ze�qO��zrJpM�{��o�5�����6���۝=�q�=B�T�         x   x�3��M,ʮ�L�(�J�rqs�OJ)
55�2.���pKw50�45t4�twK�L)O�0���4�4405��4�4�tL����2��K��L,&�#s#SccK3Kΐ����".c΀ j����  ?�     