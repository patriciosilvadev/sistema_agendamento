PGDMP                 	        x            agendamento    12.2    12.2 >    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            W           1262    17067    agendamento    DATABASE     �   CREATE DATABASE agendamento WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE agendamento;
                postgres    false            �            1259    17127 
   attendance    TABLE     �   CREATE TABLE public.attendance (
    attendace_id integer NOT NULL,
    attendace_date date NOT NULL,
    opening_hours character varying(255) NOT NULL,
    company_id_attendance integer NOT NULL
);
    DROP TABLE public.attendance;
       public         heap    postgres    false            �            1259    17125    attendance_attendace_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attendance_attendace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.attendance_attendace_id_seq;
       public          postgres    false    213            X           0    0    attendance_attendace_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.attendance_attendace_id_seq OWNED BY public.attendance.attendace_id;
          public          postgres    false    212            �            1259    17099 	   companies    TABLE     a  CREATE TABLE public.companies (
    company_id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    company_password character varying(255) NOT NULL,
    company_email character varying(255) NOT NULL,
    company_tel character varying(255),
    company_cnpj character varying(255),
    create_date_company timestamp with time zone
);
    DROP TABLE public.companies;
       public         heap    postgres    false            �            1259    17097    companies_company_id_seq    SEQUENCE     �   CREATE SEQUENCE public.companies_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.companies_company_id_seq;
       public          postgres    false    209            Y           0    0    companies_company_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.companies_company_id_seq OWNED BY public.companies.company_id;
          public          postgres    false    208            �            1259    17070    knex_migrations    TABLE     �   CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);
 #   DROP TABLE public.knex_migrations;
       public         heap    postgres    false            �            1259    17068    knex_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.knex_migrations_id_seq;
       public          postgres    false    203            Z           0    0    knex_migrations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;
          public          postgres    false    202            �            1259    17078    knex_migrations_lock    TABLE     `   CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);
 (   DROP TABLE public.knex_migrations_lock;
       public         heap    postgres    false            �            1259    17076    knex_migrations_lock_index_seq    SEQUENCE     �   CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.knex_migrations_lock_index_seq;
       public          postgres    false    205            [           0    0    knex_migrations_lock_index_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;
          public          postgres    false    204            �            1259    17140    schedule    TABLE       CREATE TABLE public.schedule (
    schedule_id integer NOT NULL,
    status boolean NOT NULL,
    company_id_schedule integer NOT NULL,
    user_id_schedule integer NOT NULL,
    service_id_schedule integer NOT NULL,
    attendace_id_schedule integer NOT NULL
);
    DROP TABLE public.schedule;
       public         heap    postgres    false            �            1259    17138    schedule_schedule_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedule_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.schedule_schedule_id_seq;
       public          postgres    false    215            \           0    0    schedule_schedule_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.schedule_schedule_id_seq OWNED BY public.schedule.schedule_id;
          public          postgres    false    214            �            1259    17114    services    TABLE     �   CREATE TABLE public.services (
    service_id integer NOT NULL,
    service_name character varying(255) NOT NULL,
    value numeric(8,2) NOT NULL,
    company_id_service integer NOT NULL
);
    DROP TABLE public.services;
       public         heap    postgres    false            �            1259    17112    services_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.services_service_id_seq;
       public          postgres    false    211            ]           0    0    services_service_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;
          public          postgres    false    210            �            1259    17086    users    TABLE       CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    user_password character varying(255) NOT NULL,
    user_email character varying(255) NOT NULL,
    user_tel character varying(255),
    create_data timestamp with time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17084    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    207            ^           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    206            �
           2604    17130    attendance attendace_id    DEFAULT     �   ALTER TABLE ONLY public.attendance ALTER COLUMN attendace_id SET DEFAULT nextval('public.attendance_attendace_id_seq'::regclass);
 F   ALTER TABLE public.attendance ALTER COLUMN attendace_id DROP DEFAULT;
       public          postgres    false    212    213    213            �
           2604    17102    companies company_id    DEFAULT     |   ALTER TABLE ONLY public.companies ALTER COLUMN company_id SET DEFAULT nextval('public.companies_company_id_seq'::regclass);
 C   ALTER TABLE public.companies ALTER COLUMN company_id DROP DEFAULT;
       public          postgres    false    209    208    209            �
           2604    17073    knex_migrations id    DEFAULT     x   ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);
 A   ALTER TABLE public.knex_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    17081    knex_migrations_lock index    DEFAULT     �   ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);
 I   ALTER TABLE public.knex_migrations_lock ALTER COLUMN index DROP DEFAULT;
       public          postgres    false    204    205    205            �
           2604    17143    schedule schedule_id    DEFAULT     |   ALTER TABLE ONLY public.schedule ALTER COLUMN schedule_id SET DEFAULT nextval('public.schedule_schedule_id_seq'::regclass);
 C   ALTER TABLE public.schedule ALTER COLUMN schedule_id DROP DEFAULT;
       public          postgres    false    214    215    215            �
           2604    17117    services service_id    DEFAULT     z   ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);
 B   ALTER TABLE public.services ALTER COLUMN service_id DROP DEFAULT;
       public          postgres    false    210    211    211            �
           2604    17089    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    207    206    207            O          0    17127 
   attendance 
   TABLE DATA           h   COPY public.attendance (attendace_id, attendace_date, opening_hours, company_id_attendance) FROM stdin;
    public          postgres    false    213   �K       K          0    17099 	   companies 
   TABLE DATA           �   COPY public.companies (company_id, company_name, company_password, company_email, company_tel, company_cnpj, create_date_company) FROM stdin;
    public          postgres    false    209   JL       E          0    17070    knex_migrations 
   TABLE DATA           J   COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
    public          postgres    false    203   �L       G          0    17078    knex_migrations_lock 
   TABLE DATA           @   COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
    public          postgres    false    205   �M       Q          0    17140    schedule 
   TABLE DATA           �   COPY public.schedule (schedule_id, status, company_id_schedule, user_id_schedule, service_id_schedule, attendace_id_schedule) FROM stdin;
    public          postgres    false    215   �M       M          0    17114    services 
   TABLE DATA           W   COPY public.services (service_id, service_name, value, company_id_service) FROM stdin;
    public          postgres    false    211   N       I          0    17086    users 
   TABLE DATA           e   COPY public.users (user_id, user_name, user_password, user_email, user_tel, create_data) FROM stdin;
    public          postgres    false    207   �N       _           0    0    attendance_attendace_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.attendance_attendace_id_seq', 17, true);
          public          postgres    false    212            `           0    0    companies_company_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.companies_company_id_seq', 2, true);
          public          postgres    false    208            a           0    0    knex_migrations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.knex_migrations_id_seq', 5, true);
          public          postgres    false    202            b           0    0    knex_migrations_lock_index_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);
          public          postgres    false    204            c           0    0    schedule_schedule_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.schedule_schedule_id_seq', 18, true);
          public          postgres    false    214            d           0    0    services_service_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.services_service_id_seq', 11, true);
          public          postgres    false    210            e           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);
          public          postgres    false    206            �
           2606    17132    attendance attendance_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (attendace_id);
 D   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_pkey;
       public            postgres    false    213            �
           2606    17111 '   companies companies_company_cnpj_unique 
   CONSTRAINT     j   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_company_cnpj_unique UNIQUE (company_cnpj);
 Q   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_company_cnpj_unique;
       public            postgres    false    209            �
           2606    17109 (   companies companies_company_email_unique 
   CONSTRAINT     l   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_company_email_unique UNIQUE (company_email);
 R   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_company_email_unique;
       public            postgres    false    209            �
           2606    17107    companies companies_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (company_id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            postgres    false    209            �
           2606    17083 .   knex_migrations_lock knex_migrations_lock_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);
 X   ALTER TABLE ONLY public.knex_migrations_lock DROP CONSTRAINT knex_migrations_lock_pkey;
       public            postgres    false    205            �
           2606    17075 $   knex_migrations knex_migrations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.knex_migrations DROP CONSTRAINT knex_migrations_pkey;
       public            postgres    false    203            �
           2606    17145    schedule schedule_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);
 @   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_pkey;
       public            postgres    false    215            �
           2606    17119    services services_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);
 @   ALTER TABLE ONLY public.services DROP CONSTRAINT services_pkey;
       public            postgres    false    211            �
           2606    17094    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    207            �
           2606    17096    users users_user_email_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_email_unique UNIQUE (user_email);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_email_unique;
       public            postgres    false    207            �
           2606    17133 (   attendance attendance_company_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_company_id_foreign FOREIGN KEY (company_id_attendance) REFERENCES public.companies(company_id);
 R   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_company_id_foreign;
       public          postgres    false    2745    209    213            �
           2606    17161 &   schedule schedule_attendace_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_attendace_id_foreign FOREIGN KEY (attendace_id_schedule) REFERENCES public.attendance(attendace_id);
 P   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_attendace_id_foreign;
       public          postgres    false    2749    215    213            �
           2606    17146 $   schedule schedule_company_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_company_id_foreign FOREIGN KEY (company_id_schedule) REFERENCES public.companies(company_id);
 N   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_company_id_foreign;
       public          postgres    false    2745    215    209            �
           2606    17156 $   schedule schedule_service_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_service_id_foreign FOREIGN KEY (service_id_schedule) REFERENCES public.services(service_id);
 N   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_service_id_foreign;
       public          postgres    false    211    2747    215            �
           2606    17151 !   schedule schedule_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_user_id_foreign FOREIGN KEY (user_id_schedule) REFERENCES public.users(user_id);
 K   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_user_id_foreign;
       public          postgres    false    207    2737    215            �
           2606    17120 $   services services_company_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_company_id_foreign FOREIGN KEY (company_id_service) REFERENCES public.companies(company_id);
 N   ALTER TABLE ONLY public.services DROP CONSTRAINT services_company_id_foreign;
       public          postgres    false    209    2745    211            O   n   x�e�K� е��f��=K���I�Ѝ��:��#y��x GQ�,���bܐ�<l��`�?b�B���6-J�����6��0F�-l	74�0m;0�U�=D�ݙ6      K   �   x�]�K
!D��)���ݶ]Yd�3dc������q �!oUU��\�{-k+���k-32:�w�C�J�c� �R�B���5FM)#gIV�t��K��,>�k/s���?����"��z�J��,      E   �   x�}�A
�0F�9E/`�g2I�g)��ZZ[���5�(�~|<�8x�4�L�5��Tѷ�p5�����V7��0�7F$Fbzܟ�8�C�4�jvԐP\��!��ĶH��`]��9�}7�\,���
tR��,�b��K�ۡ$�"�Z)��QB<      G      x�3�4������ V      Q   l   x�M��AB�PL������s*���X��O0x�*�}��~�6O���ut�ФT7��z�q�XH���+�L�!|J_�7�Nv���M�~ㅣ'�O��P|=H~ s       M   �   x�3�t�/*IU�KTI-�/-J�44�30�4�2BH�^XX����i�2ƔR�VHJ,JBh7�0����� ]��T�������`�`��^tFz� ��0�0�Ī�l�JC,!dh�4�#���� q\q)      I   �   x���=�0��9H�8�'6&���С�M� �Y�,��YOz�,�� Kni��~\�i6�u1C��:v��;)�5�,		5F�igY\t&!it��y,�:��ki�w�H�1p�9|QY|�@7*���4��	i#�?��`�&rlTg�RO�E}     