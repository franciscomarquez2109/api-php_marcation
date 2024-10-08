PGDMP  !    	                |         	   marcacion    16.2 (Debian 16.2-1.pgdg120+2)    16.2 (Debian 16.2-1.pgdg120+2) s    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384 	   marcacion    DATABASE     t   CREATE DATABASE marcacion WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE marcacion;
                postgres    false                        3079    41052    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false            �           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            �            1259    16471 	   auditoria    TABLE     
  CREATE TABLE public.auditoria (
    id_auditoria integer NOT NULL,
    tabla character varying(50) NOT NULL,
    id_registro integer NOT NULL,
    fecha_cambio timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tipo_cambio character varying(10) NOT NULL,
    detalles text,
    usuario character varying(50) NOT NULL,
    CONSTRAINT auditoria_tipo_cambio_check CHECK (((tipo_cambio)::text = ANY ((ARRAY['INSERT'::character varying, 'UPDATE'::character varying, 'DELETE'::character varying])::text[])))
);
    DROP TABLE public.auditoria;
       public         heap    postgres    false            �            1259    16470    auditoria_id_auditoria_seq    SEQUENCE     �   CREATE SEQUENCE public.auditoria_id_auditoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.auditoria_id_auditoria_seq;
       public          postgres    false    231            �           0    0    auditoria_id_auditoria_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.auditoria_id_auditoria_seq OWNED BY public.auditoria.id_auditoria;
          public          postgres    false    230            �            1259    16397    cargo    TABLE     n   CREATE TABLE public.cargo (
    id_cargo integer NOT NULL,
    nombre_cargo character varying(50) NOT NULL
);
    DROP TABLE public.cargo;
       public         heap    postgres    false            �            1259    16396    cargo_id_cargo_seq    SEQUENCE     �   CREATE SEQUENCE public.cargo_id_cargo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cargo_id_cargo_seq;
       public          postgres    false    219            �           0    0    cargo_id_cargo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cargo_id_cargo_seq OWNED BY public.cargo.id_cargo;
          public          postgres    false    218            �            1259    16390    departamento    TABLE     �   CREATE TABLE public.departamento (
    id_departamento integer NOT NULL,
    nombre_departamento character varying(50) NOT NULL
);
     DROP TABLE public.departamento;
       public         heap    postgres    false            �            1259    16389     departamento_id_departamento_seq    SEQUENCE     �   CREATE SEQUENCE public.departamento_id_departamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.departamento_id_departamento_seq;
       public          postgres    false    217            �           0    0     departamento_id_departamento_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.departamento_id_departamento_seq OWNED BY public.departamento.id_departamento;
          public          postgres    false    216            �            1259    16418    empleado    TABLE     m  CREATE TABLE public.empleado (
    id_empleado integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    direccion character varying(100),
    telefono character varying(20),
    correo_electronico character varying(50),
    id_departamento integer,
    id_cargo integer,
    estado integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.empleado;
       public         heap    postgres    false            �            1259    16417    empleado_id_empleado_seq    SEQUENCE     �   CREATE SEQUENCE public.empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.empleado_id_empleado_seq;
       public          postgres    false    225            �           0    0    empleado_id_empleado_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.empleado_id_empleado_seq OWNED BY public.empleado.id_empleado;
          public          postgres    false    224            �            1259    16404    estado    TABLE     q   CREATE TABLE public.estado (
    id_estado integer NOT NULL,
    nombre_estado character varying(50) NOT NULL
);
    DROP TABLE public.estado;
       public         heap    postgres    false            �            1259    16403    estado_id_estado_seq    SEQUENCE     �   CREATE SEQUENCE public.estado_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.estado_id_estado_seq;
       public          postgres    false    221            �           0    0    estado_id_estado_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.estado_id_estado_seq OWNED BY public.estado.id_estado;
          public          postgres    false    220            �            1259    16452    evento_diario    TABLE     �   CREATE TABLE public.evento_diario (
    id_evento integer NOT NULL,
    id_empleado integer,
    fecha date NOT NULL,
    descripcion text,
    id_tipo_evento integer,
    ubicacion point NOT NULL
);
 !   DROP TABLE public.evento_diario;
       public         heap    postgres    false            �            1259    16451    evento_diario_id_evento_seq    SEQUENCE     �   CREATE SEQUENCE public.evento_diario_id_evento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.evento_diario_id_evento_seq;
       public          postgres    false    229            �           0    0    evento_diario_id_evento_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.evento_diario_id_evento_seq OWNED BY public.evento_diario.id_evento;
          public          postgres    false    228            �            1259    40989    permisos    TABLE     j   CREATE TABLE public.permisos (
    id integer NOT NULL,
    descripcion character varying(50) NOT NULL
);
    DROP TABLE public.permisos;
       public         heap    postgres    false            �            1259    40988    permisos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permisos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.permisos_id_seq;
       public          postgres    false    239            �           0    0    permisos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.permisos_id_seq OWNED BY public.permisos.id;
          public          postgres    false    238            �            1259    16435    registro_marcacion    TABLE     �   CREATE TABLE public.registro_marcacion (
    id_registro integer NOT NULL,
    id_empleado integer,
    fecha date NOT NULL,
    hora time without time zone,
    id_estado integer,
    ubicacion point NOT NULL,
    id_tipo integer NOT NULL
);
 &   DROP TABLE public.registro_marcacion;
       public         heap    postgres    false            �            1259    16434 "   registro_marcacion_id_registro_seq    SEQUENCE     �   CREATE SEQUENCE public.registro_marcacion_id_registro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.registro_marcacion_id_registro_seq;
       public          postgres    false    227            �           0    0 "   registro_marcacion_id_registro_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.registro_marcacion_id_registro_seq OWNED BY public.registro_marcacion.id_registro;
          public          postgres    false    226            �            1259    41037    rol_permisos    TABLE     c   CREATE TABLE public.rol_permisos (
    id_rol integer NOT NULL,
    id_permiso integer NOT NULL
);
     DROP TABLE public.rol_permisos;
       public         heap    postgres    false            �            1259    40980    roles    TABLE     g   CREATE TABLE public.roles (
    id integer NOT NULL,
    descripcion character varying(50) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    40979    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    237            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    236            �            1259    32774    tipo    TABLE     g   CREATE TABLE public.tipo (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);
    DROP TABLE public.tipo;
       public         heap    postgres    false            �            1259    16411    tipo_evento    TABLE     �   CREATE TABLE public.tipo_evento (
    id_tipo_evento integer NOT NULL,
    nombre_tipo_evento character varying(50) NOT NULL
);
    DROP TABLE public.tipo_evento;
       public         heap    postgres    false            �            1259    16410    tipo_evento_id_tipo_evento_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_evento_id_tipo_evento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tipo_evento_id_tipo_evento_seq;
       public          postgres    false    223            �           0    0    tipo_evento_id_tipo_evento_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.tipo_evento_id_tipo_evento_seq OWNED BY public.tipo_evento.id_tipo_evento;
          public          postgres    false    222            �            1259    32773    tipo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tipo_id_seq;
       public          postgres    false    233            �           0    0    tipo_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tipo_id_seq OWNED BY public.tipo.id;
          public          postgres    false    232            �            1259    41022    usuario_roles    TABLE     d   CREATE TABLE public.usuario_roles (
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL
);
 !   DROP TABLE public.usuario_roles;
       public         heap    postgres    false            �            1259    40966    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    id_empleado integer
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    40965    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    235            �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    234            �           2604    16474    auditoria id_auditoria    DEFAULT     �   ALTER TABLE ONLY public.auditoria ALTER COLUMN id_auditoria SET DEFAULT nextval('public.auditoria_id_auditoria_seq'::regclass);
 E   ALTER TABLE public.auditoria ALTER COLUMN id_auditoria DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    16400    cargo id_cargo    DEFAULT     p   ALTER TABLE ONLY public.cargo ALTER COLUMN id_cargo SET DEFAULT nextval('public.cargo_id_cargo_seq'::regclass);
 =   ALTER TABLE public.cargo ALTER COLUMN id_cargo DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16393    departamento id_departamento    DEFAULT     �   ALTER TABLE ONLY public.departamento ALTER COLUMN id_departamento SET DEFAULT nextval('public.departamento_id_departamento_seq'::regclass);
 K   ALTER TABLE public.departamento ALTER COLUMN id_departamento DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16421    empleado id_empleado    DEFAULT     |   ALTER TABLE ONLY public.empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleado_id_empleado_seq'::regclass);
 C   ALTER TABLE public.empleado ALTER COLUMN id_empleado DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    16407    estado id_estado    DEFAULT     t   ALTER TABLE ONLY public.estado ALTER COLUMN id_estado SET DEFAULT nextval('public.estado_id_estado_seq'::regclass);
 ?   ALTER TABLE public.estado ALTER COLUMN id_estado DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    16455    evento_diario id_evento    DEFAULT     �   ALTER TABLE ONLY public.evento_diario ALTER COLUMN id_evento SET DEFAULT nextval('public.evento_diario_id_evento_seq'::regclass);
 F   ALTER TABLE public.evento_diario ALTER COLUMN id_evento DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    40992    permisos id    DEFAULT     j   ALTER TABLE ONLY public.permisos ALTER COLUMN id SET DEFAULT nextval('public.permisos_id_seq'::regclass);
 :   ALTER TABLE public.permisos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            �           2604    16438    registro_marcacion id_registro    DEFAULT     �   ALTER TABLE ONLY public.registro_marcacion ALTER COLUMN id_registro SET DEFAULT nextval('public.registro_marcacion_id_registro_seq'::regclass);
 M   ALTER TABLE public.registro_marcacion ALTER COLUMN id_registro DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    40983    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    32777    tipo id    DEFAULT     b   ALTER TABLE ONLY public.tipo ALTER COLUMN id SET DEFAULT nextval('public.tipo_id_seq'::regclass);
 6   ALTER TABLE public.tipo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    16414    tipo_evento id_tipo_evento    DEFAULT     �   ALTER TABLE ONLY public.tipo_evento ALTER COLUMN id_tipo_evento SET DEFAULT nextval('public.tipo_evento_id_tipo_evento_seq'::regclass);
 I   ALTER TABLE public.tipo_evento ALTER COLUMN id_tipo_evento DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    40969    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �          0    16471 	   auditoria 
   TABLE DATA           s   COPY public.auditoria (id_auditoria, tabla, id_registro, fecha_cambio, tipo_cambio, detalles, usuario) FROM stdin;
    public          postgres    false    231   �       �          0    16397    cargo 
   TABLE DATA           7   COPY public.cargo (id_cargo, nombre_cargo) FROM stdin;
    public          postgres    false    219   5�       �          0    16390    departamento 
   TABLE DATA           L   COPY public.departamento (id_departamento, nombre_departamento) FROM stdin;
    public          postgres    false    217   ]�       �          0    16418    empleado 
   TABLE DATA           �   COPY public.empleado (id_empleado, nombre, apellido, direccion, telefono, correo_electronico, id_departamento, id_cargo, estado) FROM stdin;
    public          postgres    false    225   ��       �          0    16404    estado 
   TABLE DATA           :   COPY public.estado (id_estado, nombre_estado) FROM stdin;
    public          postgres    false    221   8�       �          0    16452    evento_diario 
   TABLE DATA           n   COPY public.evento_diario (id_evento, id_empleado, fecha, descripcion, id_tipo_evento, ubicacion) FROM stdin;
    public          postgres    false    229   ^�       �          0    40989    permisos 
   TABLE DATA           3   COPY public.permisos (id, descripcion) FROM stdin;
    public          postgres    false    239   ĉ       �          0    16435    registro_marcacion 
   TABLE DATA           r   COPY public.registro_marcacion (id_registro, id_empleado, fecha, hora, id_estado, ubicacion, id_tipo) FROM stdin;
    public          postgres    false    227   �       �          0    41037    rol_permisos 
   TABLE DATA           :   COPY public.rol_permisos (id_rol, id_permiso) FROM stdin;
    public          postgres    false    241   X�       �          0    40980    roles 
   TABLE DATA           0   COPY public.roles (id, descripcion) FROM stdin;
    public          postgres    false    237   ��       �          0    32774    tipo 
   TABLE DATA           /   COPY public.tipo (id, descripcion) FROM stdin;
    public          postgres    false    233   ��       �          0    16411    tipo_evento 
   TABLE DATA           I   COPY public.tipo_evento (id_tipo_evento, nombre_tipo_evento) FROM stdin;
    public          postgres    false    223   ��       �          0    41022    usuario_roles 
   TABLE DATA           ;   COPY public.usuario_roles (id_usuario, id_rol) FROM stdin;
    public          postgres    false    240   7�       �          0    40966    usuarios 
   TABLE DATA           E   COPY public.usuarios (id, nombre, password, id_empleado) FROM stdin;
    public          postgres    false    235   X�       �           0    0    auditoria_id_auditoria_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.auditoria_id_auditoria_seq', 1, false);
          public          postgres    false    230            �           0    0    cargo_id_cargo_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cargo_id_cargo_seq', 1, true);
          public          postgres    false    218            �           0    0     departamento_id_departamento_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.departamento_id_departamento_seq', 1, true);
          public          postgres    false    216            �           0    0    empleado_id_empleado_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.empleado_id_empleado_seq', 12, true);
          public          postgres    false    224            �           0    0    estado_id_estado_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.estado_id_estado_seq', 1, true);
          public          postgres    false    220            �           0    0    evento_diario_id_evento_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.evento_diario_id_evento_seq', 1, true);
          public          postgres    false    228            �           0    0    permisos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.permisos_id_seq', 4, true);
          public          postgres    false    238            �           0    0 "   registro_marcacion_id_registro_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.registro_marcacion_id_registro_seq', 11, true);
          public          postgres    false    226            �           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
          public          postgres    false    236            �           0    0    tipo_evento_id_tipo_evento_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tipo_evento_id_tipo_evento_seq', 2, true);
          public          postgres    false    222            �           0    0    tipo_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.tipo_id_seq', 3, true);
          public          postgres    false    232            �           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);
          public          postgres    false    234            	           2606    16480    auditoria auditoria_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT auditoria_pkey PRIMARY KEY (id_auditoria);
 B   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT auditoria_pkey;
       public            postgres    false    231            �           2606    16402    cargo cargo_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id_cargo);
 :   ALTER TABLE ONLY public.cargo DROP CONSTRAINT cargo_pkey;
       public            postgres    false    219            �           2606    16395    departamento departamento_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public            postgres    false    217            �           2606    16423    empleado empleado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    225            �           2606    16409    estado estado_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id_estado);
 <   ALTER TABLE ONLY public.estado DROP CONSTRAINT estado_pkey;
       public            postgres    false    221                       2606    16459     evento_diario evento_diario_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.evento_diario
    ADD CONSTRAINT evento_diario_pkey PRIMARY KEY (id_evento);
 J   ALTER TABLE ONLY public.evento_diario DROP CONSTRAINT evento_diario_pkey;
       public            postgres    false    229                       2606    40996 !   permisos permisos_descripcion_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.permisos
    ADD CONSTRAINT permisos_descripcion_key UNIQUE (descripcion);
 K   ALTER TABLE ONLY public.permisos DROP CONSTRAINT permisos_descripcion_key;
       public            postgres    false    239                       2606    40994    permisos permisos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.permisos DROP CONSTRAINT permisos_pkey;
       public            postgres    false    239                       2606    16440 *   registro_marcacion registro_marcacion_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.registro_marcacion
    ADD CONSTRAINT registro_marcacion_pkey PRIMARY KEY (id_registro);
 T   ALTER TABLE ONLY public.registro_marcacion DROP CONSTRAINT registro_marcacion_pkey;
       public            postgres    false    227                       2606    41041    rol_permisos rol_permisos_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.rol_permisos
    ADD CONSTRAINT rol_permisos_pkey PRIMARY KEY (id_rol, id_permiso);
 H   ALTER TABLE ONLY public.rol_permisos DROP CONSTRAINT rol_permisos_pkey;
       public            postgres    false    241    241                       2606    40987    roles roles_descripcion_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_descripcion_key UNIQUE (descripcion);
 E   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_descripcion_key;
       public            postgres    false    237                       2606    40985    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    237            �           2606    16416    tipo_evento tipo_evento_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tipo_evento
    ADD CONSTRAINT tipo_evento_pkey PRIMARY KEY (id_tipo_evento);
 F   ALTER TABLE ONLY public.tipo_evento DROP CONSTRAINT tipo_evento_pkey;
       public            postgres    false    223                       2606    32779    tipo tipo_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tipo DROP CONSTRAINT tipo_pkey;
       public            postgres    false    233                       2606    41026     usuario_roles usuario_roles_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.usuario_roles
    ADD CONSTRAINT usuario_roles_pkey PRIMARY KEY (id_usuario, id_rol);
 J   ALTER TABLE ONLY public.usuario_roles DROP CONSTRAINT usuario_roles_pkey;
       public            postgres    false    240    240                       2606    40973    usuarios usuarios_nombre_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_nombre_key UNIQUE (nombre);
 F   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_nombre_key;
       public            postgres    false    235                       2606    40971    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    235                        1259    16482    idx_empleado_cargo    INDEX     K   CREATE INDEX idx_empleado_cargo ON public.empleado USING btree (id_cargo);
 &   DROP INDEX public.idx_empleado_cargo;
       public            postgres    false    225                       1259    16481    idx_empleado_departamento    INDEX     Y   CREATE INDEX idx_empleado_departamento ON public.empleado USING btree (id_departamento);
 -   DROP INDEX public.idx_empleado_departamento;
       public            postgres    false    225                       1259    16484     idx_evento_diario_empleado_fecha    INDEX     h   CREATE INDEX idx_evento_diario_empleado_fecha ON public.evento_diario USING btree (id_empleado, fecha);
 4   DROP INDEX public.idx_evento_diario_empleado_fecha;
       public            postgres    false    229    229                       1259    16483 %   idx_registro_marcacion_empleado_fecha    INDEX     r   CREATE INDEX idx_registro_marcacion_empleado_fecha ON public.registro_marcacion USING btree (id_empleado, fecha);
 9   DROP INDEX public.idx_registro_marcacion_empleado_fecha;
       public            postgres    false    227    227                       2606    16429    empleado empleado_id_cargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_id_cargo_fkey FOREIGN KEY (id_cargo) REFERENCES public.cargo(id_cargo);
 I   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_id_cargo_fkey;
       public          postgres    false    225    219    3321                       2606    16424 &   empleado empleado_id_departamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamento(id_departamento);
 P   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_id_departamento_fkey;
       public          postgres    false    217    225    3319            !           2606    16460 ,   evento_diario evento_diario_id_empleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evento_diario
    ADD CONSTRAINT evento_diario_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);
 V   ALTER TABLE ONLY public.evento_diario DROP CONSTRAINT evento_diario_id_empleado_fkey;
       public          postgres    false    3327    229    225            "           2606    16465 /   evento_diario evento_diario_id_tipo_evento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evento_diario
    ADD CONSTRAINT evento_diario_id_tipo_evento_fkey FOREIGN KEY (id_tipo_evento) REFERENCES public.tipo_evento(id_tipo_evento);
 Y   ALTER TABLE ONLY public.evento_diario DROP CONSTRAINT evento_diario_id_tipo_evento_fkey;
       public          postgres    false    223    3325    229                       2606    32780    registro_marcacion fk_tipo    FK CONSTRAINT     x   ALTER TABLE ONLY public.registro_marcacion
    ADD CONSTRAINT fk_tipo FOREIGN KEY (id_tipo) REFERENCES public.tipo(id);
 D   ALTER TABLE ONLY public.registro_marcacion DROP CONSTRAINT fk_tipo;
       public          postgres    false    3339    233    227                       2606    16441 6   registro_marcacion registro_marcacion_id_empleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.registro_marcacion
    ADD CONSTRAINT registro_marcacion_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);
 `   ALTER TABLE ONLY public.registro_marcacion DROP CONSTRAINT registro_marcacion_id_empleado_fkey;
       public          postgres    false    225    227    3327                        2606    16446 4   registro_marcacion registro_marcacion_id_estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.registro_marcacion
    ADD CONSTRAINT registro_marcacion_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado);
 ^   ALTER TABLE ONLY public.registro_marcacion DROP CONSTRAINT registro_marcacion_id_estado_fkey;
       public          postgres    false    227    221    3323            &           2606    41047 )   rol_permisos rol_permisos_id_permiso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rol_permisos
    ADD CONSTRAINT rol_permisos_id_permiso_fkey FOREIGN KEY (id_permiso) REFERENCES public.permisos(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.rol_permisos DROP CONSTRAINT rol_permisos_id_permiso_fkey;
       public          postgres    false    241    239    3351            '           2606    41042 %   rol_permisos rol_permisos_id_rol_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rol_permisos
    ADD CONSTRAINT rol_permisos_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.rol_permisos DROP CONSTRAINT rol_permisos_id_rol_fkey;
       public          postgres    false    3347    237    241            $           2606    41032 '   usuario_roles usuario_roles_id_rol_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_roles
    ADD CONSTRAINT usuario_roles_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.usuario_roles DROP CONSTRAINT usuario_roles_id_rol_fkey;
       public          postgres    false    240    237    3347            %           2606    41027 +   usuario_roles usuario_roles_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_roles
    ADD CONSTRAINT usuario_roles_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.usuario_roles DROP CONSTRAINT usuario_roles_id_usuario_fkey;
       public          postgres    false    235    3343    240            #           2606    40974 "   usuarios usuarios_id_empleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_id_empleado_fkey;
       public          postgres    false    225    3327    235            �      x������ � �      �      x�3��/H-JL�/����� (+)      �      x�3��/H-JL�/J-����� 5f      �   �   x��α
�0����)�u+I�Ժ)-�C���˥�j��`J|z����� g��8
�{�0\�ATo���-��9��2�X��T-�y����:�߁'���5'b&(I>�9���a�W���'J��^�Ø}S(�
Z
j�v(16˗�ͦtF(���w&qq�      �      x�3�tL.�,������ lS      �   V   x�3�4�4202�50�5��,NUHI<�1_�4O!91)'(��kf�gdhflhjdlfbbba�c�gjindnf`lh`hlni������ �]�      �   1   x�3�t.JM,�2��IM-�2�tL.)M�ɬ��p��d�f��1z\\\ u      �   C   x���� �7T��D�;�Z쿎�B�1��@��	,�<#{�X�ʯ��͝�0��~z����      �      x�3�4�2�4bc 6����� W�      �   -   x�3�tL����,.)JL�/�2�tM�,2�9�2S�S��b���� �q�      �   *   x�3�t�+)JLI�2�tI-NN�+��2�N�����qqq �	�      �   .   x�3�(�O/J�M�2�)J�+��,���SH�S(�,������ �G�      �      x�3�4����� ]      �   W   x�3�4210��02�T1JT10S	4-p�4�L	�/�rO)�t����HM+�*��q,��s�2I�+,K.�
1�(t2M�J�4����� Y�     