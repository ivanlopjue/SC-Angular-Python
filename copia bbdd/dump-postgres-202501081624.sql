PGDMP                       }            postgres    17.2    17.2     5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            8           1262    5    postgres    DATABASE     {   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE postgres;
                     postgres    false            9           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4920                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            :           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16433    ship_component    TABLE     �  CREATE TABLE public.ship_component (
    id integer NOT NULL,
    ship_id integer NOT NULL,
    type character varying(255),
    name character varying(255),
    mounts integer,
    component_size character varying(50),
    category character varying(50),
    size character varying(50),
    details text,
    quantity integer,
    manufacturer character varying(255),
    component_class character varying(255)
);
 "   DROP TABLE public.ship_component;
       public         heap r       postgres    false    4            �            1259    16432    ship_component_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ship_component_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ship_component_id_seq;
       public               postgres    false    222    4            ;           0    0    ship_component_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ship_component_id_seq OWNED BY public.ship_component.id;
          public               postgres    false    221            �            1259    16399 	   ship_info    TABLE     �  CREATE TABLE public.ship_info (
    id integer NOT NULL,
    nombre character varying(255),
    largo double precision,
    ancho double precision,
    alto double precision,
    masa double precision,
    carga double precision,
    tripulacion_min integer,
    tripulacion_max integer,
    velocidad_scm double precision,
    velocidad_max double precision,
    pcasco double precision,
    pescudo double precision,
    combustible_capacidad double precision,
    combustible_consumo_principal double precision,
    combustible_consumo_maniobra double precision,
    quantum_velocidad double precision,
    quantum_preparacion double precision,
    quantum_capacidad double precision,
    quantum_rango double precision,
    agilidad_cabeceo double precision,
    agilidad_guinada double precision,
    agilidad_alabeo double precision,
    foco jsonb,
    tipo character varying(255),
    descripcion text,
    manufacturer character varying(255)
);
    DROP TABLE public.ship_info;
       public         heap r       postgres    false    4            �            1259    16398    ship_info_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ship_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.ship_info_id_seq;
       public               postgres    false    218    4            <           0    0    ship_info_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.ship_info_id_seq OWNED BY public.ship_info.id;
          public               postgres    false    217            �            1259    16410 
   ship_parts    TABLE     �   CREATE TABLE public.ship_parts (
    id integer NOT NULL,
    ship_id integer,
    name character varying(255),
    damage_max integer,
    parent_id integer
);
    DROP TABLE public.ship_parts;
       public         heap r       postgres    false    4            �            1259    16409    ship_parts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ship_parts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ship_parts_id_seq;
       public               postgres    false    220    4            =           0    0    ship_parts_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ship_parts_id_seq OWNED BY public.ship_parts.id;
          public               postgres    false    219            �           2604    16436    ship_component id    DEFAULT     v   ALTER TABLE ONLY public.ship_component ALTER COLUMN id SET DEFAULT nextval('public.ship_component_id_seq'::regclass);
 @   ALTER TABLE public.ship_component ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    16402    ship_info id    DEFAULT     l   ALTER TABLE ONLY public.ship_info ALTER COLUMN id SET DEFAULT nextval('public.ship_info_id_seq'::regclass);
 ;   ALTER TABLE public.ship_info ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    16413    ship_parts id    DEFAULT     n   ALTER TABLE ONLY public.ship_parts ALTER COLUMN id SET DEFAULT nextval('public.ship_parts_id_seq'::regclass);
 <   ALTER TABLE public.ship_parts ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            2          0    16433    ship_component 
   TABLE DATA           �   COPY public.ship_component (id, ship_id, type, name, mounts, component_size, category, size, details, quantity, manufacturer, component_class) FROM stdin;
    public               postgres    false    222   �'       .          0    16399 	   ship_info 
   TABLE DATA           �  COPY public.ship_info (id, nombre, largo, ancho, alto, masa, carga, tripulacion_min, tripulacion_max, velocidad_scm, velocidad_max, pcasco, pescudo, combustible_capacidad, combustible_consumo_principal, combustible_consumo_maniobra, quantum_velocidad, quantum_preparacion, quantum_capacidad, quantum_rango, agilidad_cabeceo, agilidad_guinada, agilidad_alabeo, foco, tipo, descripcion, manufacturer) FROM stdin;
    public               postgres    false    218   �t       0          0    16410 
   ship_parts 
   TABLE DATA           N   COPY public.ship_parts (id, ship_id, name, damage_max, parent_id) FROM stdin;
    public               postgres    false    220   ��       >           0    0    ship_component_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.ship_component_id_seq', 2605, true);
          public               postgres    false    221            ?           0    0    ship_info_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ship_info_id_seq', 179, true);
          public               postgres    false    217            @           0    0    ship_parts_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.ship_parts_id_seq', 1624, true);
          public               postgres    false    219            �           2606    16440 "   ship_component ship_component_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ship_component
    ADD CONSTRAINT ship_component_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.ship_component DROP CONSTRAINT ship_component_pkey;
       public                 postgres    false    222            �           2606    16406    ship_info ship_info_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ship_info
    ADD CONSTRAINT ship_info_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ship_info DROP CONSTRAINT ship_info_pkey;
       public                 postgres    false    218            �           2606    16415    ship_parts ship_parts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.ship_parts
    ADD CONSTRAINT ship_parts_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.ship_parts DROP CONSTRAINT ship_parts_pkey;
       public                 postgres    false    220            �           2606    16421    ship_parts fk_parent_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ship_parts
    ADD CONSTRAINT fk_parent_id FOREIGN KEY (parent_id) REFERENCES public.ship_parts(id) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.ship_parts DROP CONSTRAINT fk_parent_id;
       public               postgres    false    4758    220    220            �           2606    16441 *   ship_component ship_component_ship_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ship_component
    ADD CONSTRAINT ship_component_ship_id_fkey FOREIGN KEY (ship_id) REFERENCES public.ship_info(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.ship_component DROP CONSTRAINT ship_component_ship_id_fkey;
       public               postgres    false    4756    222    218            �           2606    16416 "   ship_parts ship_parts_ship_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ship_parts
    ADD CONSTRAINT ship_parts_ship_id_fkey FOREIGN KEY (ship_id) REFERENCES public.ship_info(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.ship_parts DROP CONSTRAINT ship_parts_ship_id_fkey;
       public               postgres    false    218    220    4756            2      x���k�7�-���W���g>ho�|$��&�uI�f�l�ڲ��V�*m=4ҿ_GVf�Ñ��c���Ȉ8ǁ8�p�+u�����zG�_]���u���o�޽���n��n>�I������O��W_�?���_�׷���{��r�x�]�����+����������l�'�b�����`�c��gF�������{z��Ϗ7�������7���G���O���Ͽ�������l��/�����a8����}���w+�w���~�����z���~�_v?�/�K�O�?�)ы��-���~�/cՔ����7׷������a�t����?�}��O��)�������?�~~x~�w�6�u�����_]���9���?���dyw������ݧ3ﮟ���my0���n~���{{�w'o
��r`����������?�櫛+�)��?���>�<>� ������V� ��l��ob�
yd�T�"��b�L$=�'f�ƳQI��ʸ�Mv�O&m�}��I���Fؤ��t �6��z��I]�l2��&KΆ�졉M�뚔L6����f6�M�l2>[��d��uel21��g�I�>��d�<x�M8��j�`�5�	�,���&X��M�gv5�Ɇ<��M6f�/�X�/�l"f�S�Z�&�Ϯ+c�3�E?������&���6���*��&�r�M.�jlR�е��~���&Oo���_<p���٢�WW��[^�=��&����e3���&�/(��E����2n��]<?���<��ϛ��ϏW?>�?d��^_�?_��U����Q?!�D/����!d dD��,,�A2��B���	�S�doc`�ydC�"��Ų��Qe1���"Fsv]��a��~2EGL���#d���S�S`>>f��@��x1�� ���z�/V,��l&4�~��>fu&s�x�l���䲁��ɿX.yh80��M�<L1[�x���u/�����~����C�[5)2�&ͺ�u�V�T�ժ�\#�EM �t��&�q���x${��R5�R��2�BM٢B���9��]En����_|�Q��/h�� [��>X|����qGOv���h�K�xR{�!�W)m9J�H�[|�����{�i�Cb=�=�.jAa₂Қ4#�h�n��[����燇맭p�� �)��.�LǗ_s4q3}nR��8���J�@�<t# ��|��ق +���T��� `�l#g�Qټ?j������aL�Q���\��~��kY�NX�ˣ�f'�# &��P/�.j���pv$�;͖�
�� K�wן� Չ���G���x��������{����3=���F$k��5��Wka"#�uG�v�Z#9em����6�_[HZ��D�Z7���H[�0|����##�3�v����>D�u��V�:�Zy�닱�E�mI}�0�+��'���^m��eU�5�ğ��؋>n���ז�L�;8�}�z_lG(��C��	a�O\�[�7n �UBܑ�j�l^��*Ԏ��'�Mc���`���f�7g�`1v�n��,��Ie�\��s��]���+�Y�55B���+'NX����W�+�'�@7<N�4a�.���2�ea|~�Qþ^j���dm����l����x��%z�G-�x.�D�ߑ���M�8�i�u#!��u��?����]Ls��{8M���>��Y��Jz˂!.$��]�X20a��-5���|����X�Cd
�Q����k���bOex��MGO�s�d�Eb=)އ�>n"�mCb����_O�5��=�r'�h�*É`ט���l/Ԗ>��0�\,G���s������gW��|t§GSШ�ެsb?�5d�j��d�:h�։{�(}�X��/Y4j���N5[w~�*+7��d�-����*l�n��-�a��زM�V&Wo8���u#=hMЫ,YC]`�X��	q��s��}�5�����h��v������������>��H�(����pa
�T���#���>�]�_'��\3���1L*���Z��`T��b�d�ko���EkX6�O/'��j�
�oǸ��;7(вs�Um��4Fm��D��{�	&��i�r���i��N�ξ�uBv�=����y�P���!�4���aMLd334e�>�_]AC�X!R�(��j�H�V�_[�<��\)�`%iYyUY�f�5���
�a�8'���o��n����z�z{{��t�a����6O�W��C��9
!K��ƅb;���E��]����Y�����w����q��tDCZ֎h��L��a��eRr���f�ϯ-$!��J�	O	hƫ��y�0|�����A�owo���'����	�¿@��|��v���>��z�����X���6oVnTLLd����[��!/oh�����y�|CCm�Eh�̓����~DGWбXP��	LC��������x��(~$�i��	p�x�O��z�@��_���M'�|�I�w��î���S^47p�1��������X��Ѷ����HN��a/�m
���6E8��6�b�@[���L|���L�����f"0���L��]m�D�k����6ښ��&���2Ԅ�f��m�|>%���~�&��6�+u�m߂��"z���({�6teϯ-܈�\y���A{����#�"d	�ūX��V�a!k�b�hBZk�M�:�Fj�?j�ɡ�BL{��p���R:r��H1��!l�bВ��M�A7��F)�8��Ro�6K1�ȡ��5�W��b�W�ç����߯6w���A@���m��!���1��X�d�i,����L�&���6�%Л��P�:�������Uzژt� ��g3�Z۷X��]\�&�.�h��uka$�u��q���k�n��jcy;�L�	Ç��;�Lu�+�.�#,w��!a���w��4��o�R���O�Vc_��v��E��h��Ѷ��~��@�%un/���p"��7�	7R�[��wp����D�'�Qg߽����<�9��G�͛{y���>�������6�.U�q�v�-dL��E�``"�a�G�v#9�����Y8����!��!��S(�f�s��,�'��>�Zg�H�q5�b;���x�FB�^5����1�?H��e05��11al����m�6�1���(��F5��h�\Ҭ�@�noWc�v�5�1�����D�1�NS�i�8)އ��v"�}��V;�����,���6�v_1[���B�fʔX�Z���l,�ma+���L���ݒ�/�w{�{��U����Rj���F_���82^�PlGx�"�C�kE����|�\ o/+�8�A�f*�X_!v��p8�C��X�T���������+��p"�+��UEO6�ߍM�C�ilg�����WC���՘b;Ԗ��>$|5��q�B_V@q���T@�&&2�B�f*�x�C�XU�(��jT�V�_[�Wh�*�X�B����ſ`Y��0A���5�KH�?� ��4}�78�j��.�_�>q�sc���,Ld|u�h�>�:#9_]����.�_[�W���4߾�a���o7pu{ Ϋ�O7��o������x�B�{?�*o����3�o�Z凷����	<��8�cje�'4ɂ��v$x����O���6�a�\�0��iϕ
c{�\٠aҿ��S�ն����#{�lppѸ�����{�ls�K{�l��h,��!alߩLd�;��m�b+jɃw4���hϯ-���I�V٢#ʢ���
̟�w��o��06�l��,���mC�R\���������^�-�@'���* o����=e�����ǻ5�$���\���ٔ��X'c��X�?ڶ/�R���q)�^Ƹ�ί-c��&8�	knR0�Qr�.�#g�L��Q�>���{n"�	Ν�\yx�'�L���jU7��%ߡ�όtn�3����Mi6��Nq����5���Xj�G��؞�#N��Q�/||�Ϗ�e�S��m N9�׷�0�vʟ_[�ĩ 'clS>��9���jko���#퍜V��6�7rZ�>$퍜&v�7rږ!�L�4����`��"_    ��@r:�\he�tϲj��N�E��mg�U;r��D�j�#�Q�X�÷r8V�Z�S���ז�r8jqU���n��ŕmc�!��/T�p톜��V��-����i�N�m���%���5r���n�Y����-ى��nS쫺q��D�w6m�?��0�}hӹ�pA�&8,&�*Ox��M��kZLB�fjG���^����3�ſs�vd9�<�C��9x���~K8�`��buc5��0�WM� I�i�i��~(��4�hE��t-��qP��+bꦊ��#\,Ne��?5�3�^_,_v+�x���a*�#4��!�aм?	���|"��@-����A��+�qв��5�6�*�c����{�8�A���8(���1Bw��H�}���k�/�C�އ��1��$����ƽ6JwZ����#� no�ʬ���L4L*�|�A�f�1M��2��:��>.!~7��Tn ���
*�Fi	;<a��g��;�)~R�V޳�O�w�Hf?�GW�.?��_�Q9;��T����OO���}>w��]٩��~���B?��X�x�mf����,�j����^��k�X��k����F\*�a�
He7��f7�E��ë��B�W��Сb��q�)���w:�lـ��V뱴���7�q����-3�.�jØ�]��ZFv�����������ڙ������#�[�ޗjpUy��`%_F�_����X���ǽC��`|jw�~���xf�z�W�7���o�����L�i�NPC���C�7lg�\L1�X6�,<�M�}��Y�{C������T5����C���8CX�9��B�����	jf��D`	g�	?o��
����2��er�Tc�zlC�	f]S����:k�T�tն5T;st#�5���s��9}��&�������Q{I�4����ǧ)�:�q���e��W�M����rd����!�-<�Z0[xW"Bc�����oO0l����W]H荅�'|�'�m��0�l�0?�N�0ZZ2u�>h���S���6����Lt�j�����Zx�C�g����\'b�H�	.�5¼���i6zU�3�@�h,��QclO���&�#ڣms���F�
>=�E��}�זU���D�S�Tl9�4�|�v?>?����H�[r`E��y���O���?�P���O� ��ts�|#ͩ}"����V��O��SJ��y����̃C�s57@ib���x�)���0e5� �IalOL	���(���m�cJ�,��1%@0�� �l���e1%@R?+����'�����A���T��f[����ފ�BAM5��PP�w �BAi�aS
�������#mQ((��H
�P���"xml	`�PPq����͠�|Y��E(�L�"k�`"*P�نa'��_,]�]��^T��7�=�7��D" �7��!:�!D��;�3��B�!
B���!���B�!���C�c�_-�����P�TP��T���ncK�E� NE��GE�/��4�P�Xw���5�6�D4��w�FsK:���n*�m��#���
���JsG�cY��+��*��pl��^P�f7�� 9����2�kP���f� %���"�kP�G�k�/T8��Brc�#��>�w�Q|�w�<�P|,�o���7�����q��W�/�@���R��̕�I����tp^_��.ЧW���� ��B�"�"
��W�-)� ź�H� i��H� }���]�H-<�3@��=�3D��<*GB�,*Gw~mٮ�	9�Cy;�$VZW[�	B�$M�����r4g>��z$T67n[f�vH��5����.�$�J�AH�m��48)�H��a/C~J�ז�G�4�I%�yhW��D�6N���v���>��+���D(�o�'W��F�8�F>.�D`['��V�2N��B�8�j�^��?}�����ݻ��_VM���林}P:<��f.w���
�1������(�De����$*#q<���^O�
����DT*�#�AO�����	Z���8k�064A�50h�X_`Є�M�����e1$�����rF�$�DF_3m��k���5�2�s~m!}��}����(�c�t�Ɨ����G�L@x�
2	o	YC����V�ی�e�Gk0��e��D���;�6nF�a$g�������kY�?�\c�;y1�=c��n��`t���G;G�����F�9�˙�o>�k�`�#��M�.�l�{�]�����wO��%?�-/F���f�=]��l�=�q}�M�i��+�푞��0�T��M-o����E��0we���^�_4z~��{N�k������}��1vd1'�b;s��}HZ�`x�-�o��`��6���i��ǉ@��k�ww��(k<4���]�	&2���h���aY�䴏�2�Gs~�*�+7`�Dƥ�����}��ﰉK1�4r)�4M���4��i"��>쪴_- �7VFh�}#$�J`�EP�{����FH��*@�p�	Zyc {	ʹ�?`�r>�0A9��c��&�;l!~�\�A��D`��� M� ��s��#�O��񘏤v�5��d�-��}j	�8S�ǚ�0�s�K�^�9���JP�W5\��˂'�F���{�I�'	�b��>�2\ax2Y.^����Pi���v���pݥ}FŲv�{����B��ä�mA��6�b�],?��m%z[Шӆ԰�3A����<F_�e��{��`l��1&�o�8	ގ��6�0|���+��M��"al��L:�U0<>��l||�`���.�t�V4��l��<��=� ��jwa8{��h���/�M��_�S>����6mm�K.c��ܢ�,��|�����G����G��L�G�<�z�QG)vߘ��o <_Q��V)�Էw.H)~,��<aG��m��������.y�Zc*/y�X��f�<O��'u�Q�L p�'��
�a��,Hu�m�A�Ht�f
�؎ !X�G��)fO���-�S���9��K!��`
���q
�ƃR�8[
�&��Xn��6�0��8��m;�������G����8ޟ�1���``����F'[+�S�Y�	3)�݀�j�=�X���@�m��@��H�J��5P�����R���BM�T����(މ��١������L�vG0�_%fK[ ܶL��	�#'�g��KN�;�������_�?�?��*�y����w�~����1��������>�L���2"O�Ƀ�|�IM��;��q3�������ف�ų�=�zKk��{p�"�l��/�C$W�w�IGfZ˞c�ʧ�oo���k��&��QR��=I��Kfj�ݺ��I��J/�l]�)g#;7�xf��P�<��ʎ2���Ƀ=��_����Ѹ��:�j��f�!��:�����/l�����ۯ\��'T��~ۣ�=6GCX�{Ȗ�� C����׸/1'б�?���%�5��*��͗Y*������f!����;vY
@+��e�zYBCJoܴ[�1D���d�}�*/j_�|�}��t�{}����Y��C�a ��>xFMv�x'��>�p�?Ip� �58�XpC�?0�p��Z)7A/+���0��>�/�Wa�-e��E	?�F%�:wD	�a5%��a������(��9�?��^��$�Nإ¶'��� �J�@`#w �5O���2���ק?v�[��TܟƜ,	e�U>?ӯ|e�m�E��0�����FH���4V4	�4���ե4�
^�4���8މh��5�T�kes$̍�9�ةz��H�c�Nm/�c:7��d�$n"��.
�V�EARs_�EA���<�e+2$��}�$Y��IrG�h�<��I
p �&)�_]MR�Y4Q�T�G����DM�DPD��y]p�M�g�E�����h��/�VLoF�<m�#n\�G�ղ ����X��'�"r6���������DVJ�JNd�Ȉ��=    ����J9x������e��_����x;ǟ������u���ݧ��a`�����O�3��������3niJ��!JO�x(Di�;�(M�k&�&x}�]i;�%�ѕ΀k�@�{�:�Ft<w�`5��@`���/Zn߅��#;�7[��V�[����!x	��9`�u7���Y��Z��!��e�%l�C�w?��>\�w��?�R�gz���j���k�#�5��ڣqa��� a��!am8��t�^�(�x'�)�Mp(YE;U���?GP�#�5O�Ζ�%�q�0�I^u���8���>7��s�-2�+�����}t��.��˫��h�AW��Uqف�!]��7_R�_!ǯJ㚙
�Ba�=��\	[���	^������oO8�w �5ϯ�p�9�Bvo<$6�S��m,l�����{�H�� tvi����>z�H��ʣn�G��0'��N�}(���ŕ-	EUz���㡥@�����#a�qkN�g�/���Hkl���j;e+
bz��JA=߬>�*���LA�=�#[Xz���LA/=${��"!��~ lH�V>v`E�A(�[OS1!���DDl=�Z��'3~��z"��[O�bk��'N���7���D�T���m����Ѹ�����ف�QS�l�ϯ.$��.<$�b<D��j2�*��&VZ��֞3�'�+�{}u�ZO3��CsZ������f���i��Ul<#6��gma#�vG�>k�>� B>�x~u)�u�����6L�!��b<���B�!�IB����!���B�!�u� C`�ټho+�&m2���ȃ���N��٪�q���� ���!��=�����������!j��;�Q��$Դ�R��ƨ�{��tzf�6;;�[�96l�v}�gT������<l�|v�h��ga5�g��@�g?�_]�g��E�g���������	k>��Z��	tc|���N>{�^m������}�p}}���.������:/.��3&[K�t�0�+s���M�)HE;�A��]A`��M�3A>R[�1_�������ه���RbK����%s�����c1�Ô]|6u����KƸ*�;��<!E��7�0B.�Nd�)��6�~"�߹�]��ś��6��N�!c1n�W<�c�Pk��N�E��`#�C�G�8$3IJ��akJ��"P�����U��S #~R,�_ �4��C��2�Z�%̤0�qfҰ��x�d����f����x���@��1�?�����L^d�S3�b<�85S�H*���
z�l����lDp;1������|�W��������D�����pAl�����Q��ᰵz�(?��%�[K����km;dT�ྠ�l�AAOG㎠���DviE���>�v�@��P#���5���F�+�2��&X}�]k8ф��r*cz뼯���C�k���`s$�ZE"����+���S�@���)d �K�:���B��HU���.��0���{
���$xrC���0�%u,�-AMBn{�]+�-an�ܖ��LnK��2�q�k����0��l�@��l6d��K����͆���fC��ِ�&?�l�@�?u����{��_�&<~��΋YZ��5��O����Ϸ�7���÷����ݛ�c&�����X�8���ϻ�_?��p��Z>��Z��	cc|�5a@��Toy'�O(�x������9;$PvԎ�Rk������Y�'�ȲY&LG�uxys�?�
V�mlx�^X�ť��xss��-,��d(�+����h���� 7?� �Dn�G,�:�ϐx'��씉���fq�b��/��"�zbs\M�1C�������&�ha#��;wL���j`���FI�`��Wn0dr M���a��Ҏ
���-�z��dZ��D����o�6S:n�L�w����F.�R��w������KG���_����4ap���`#㽝�Ѹ��v2����Nd���;����v��"ۘh��a<;�B1�S,�#�S�Ԧ@�e!Ox�R����*��Pొ �l�^Q�*�[Ǉ��ݪ��e�	s�L�1���l`��i��c�U�U��&�2���v���z�x!a�*�C�ךwҗr�����v{����5��Y�Q���j��}�]{�#�G�Ȯ#�"�Np ��f:��4�/��k��b���~�Ǜ�7�O�>����Nj����o��{�͔>%s�	��s�!X�����^罜�;O�X���,�Y|מ��g��Y��+&�j�T���W�5G�v��Z��^��A��Uc~����!�K�ݞe����2��n�xv[�ݎ�U�'�Xw�Z�lc�lH�����W�k�m���Ǉ��o���~�;X/�l��O���eES�2�:ˠ���f.¸q}�W��W�t秣�:�V
V���6������L|���i�;�IW��	_��Ї����������'��)�@ c���KU�]�ju��F�J��Z�2֖�M�\Q~����s1$�je��W��bH�Le�=��<�.�z� ��T5��W�0����E��Bu�P����๒���`��!�*����<q)������^$�5M��5	t/����1?�?�kf��X������򟫿��w�3������	�Gn��)��=�GB�y��Y�7�ȫ����gw�ߏ?��7���=���������Q���,�B��,���eQ�<SU�~�2?Re!�Kˢ,$��(^Ze��sM�U�fW��GK�lJ����21�7��7�����?n"�m�pAp�:P��7���jc������xZ��#��͊��N�"=[���i��Ţ�����W��jƐᛋ��{�$�|3���A���YvRr��W�B�]�:��M�B�k�r�#��Ny�I-���㒝"�g�tZ_�qIu�`v*�}���y�G�����N��;r�F�qI0E@<��?��]���ǉXC'/��zu��&�������8s�����P���V��p�	��X���?gj=P�iC���t����I��&H���z���fD�=�ɧu�y���N�����Ӊ�Ȫ����[DC�����Ƕ3�	�:��YD)ޠ`�uF�u�`�����lY/����4�+��L #A�Йx�^c�ЙDMϐub'rҙ"uV��1r]P��@Z[8kh���,��%�u'����z2����� ������W#P�6�YD���ܛ���-��/�Ms�e��6����W��H��tY�7��;W�(HG8��o�G8WPx��_��glts��L(9�`��Z��8�ht���Od$�W'��̼���ސ���������ȍLp��G>�/��>�����QR��|�D0�Ӎ�
"���.|2�rWu�.4�EY��2'+�����GFB����kd&d[�d=ʶ�ȍP�wq�2o%kT�/�3�EMc{4�g(����MB��@m%a,0#a,�c
#͊���l��������\)�� �ʑj�)9F�Zvm��ޠ��i2.��9Yw,��%3y?=�y�5�s�Ϯ/]P�@n���)�*�\J'���OS�KW2�O�}�5���m��秂���|~*X\3���sN�� ���Y�/X���t��b��SXX]<�O�Ӳl�㽟�����j"#Y��J��ۃ�W�����+Cd��+;��p��W��>��w��x�@c�PO��8xU%��^O�h赪8i��ZW�H�_^ .V��<О�����J�{kw"O{g{"O
{w�!O���?�'Y]�
Ǔ���Ǔz�T8R�*)�۷�߹��t��f���b�$�WK���EORzkч'!���Ó����Ɠ�.-{�$��j<���W<I�U�����m�i�\�E#�H�����^��mW<��}W<��l���$�K�`x��E	m�!����Eڻ��'�}UZ��<I�M���rR�a���락l�9MBNW��7��������U>m���k~5��끇��:�x��J���CUWݍ<�t5���CN    W��*��}�!�g7�]��W�noiY��z���~���w�ӕ����p�Fw�{�*^D-A|(X�Ī�0n��C���C��1��_���`z&Fc�Ֆ��C�!s����CQW�]<t����C?WҾ���nlࡗ�������6���po�\I�����h���"�d,��p2�@�����o�����!ת��C[W��kY]u�=�u%�]{��;w�����ܵ�Ԯ��k�]�=�v%�]{��j4w�!��^d�JuZ�����
S����TP�9Յ���e��T ��֜c���:��ں��4v՝����Hv4@{W�w���3�j�:KG�����������{����d����i�+#v?��n�3��oo>�2s�����q����+i<@�W�� ��/"�U�*!�����^���^����At�'�m���j=�%@�W����򪚪���bS�,M ������y�ڼjn���F 7B2B�_[��+N�
��h�:���EFdS0(!��������(�6��Uk� �^u�y��U%!l�؆n��ϻ	���H� _I�S��j�ț _��͌�x�6oe4���u��;�~9.�>	m8ඕ���n���`���P��f^vu����+�1B����H�Jz�K�~��O~	����A a�5[H�9%'��/́R�G�	~�x��|A���^���G_ ����lr���4�@y &���������a�E����Tx a���^]��!��M-=k@Z}S2�rUR��ƾ��/%�h�����R7�h��pX���7E�<���<��ye:{�$�3�m~G^ u~���@b��\�n ��)���H¯&�Y�lߑ��ԧ��;���Iz���57�����t��+;��h�ܮ���4Bu��4�O*�=� @�g�Ȱ��uنe���R*P�&{�Q*RAW3�!���b� ^W�������z��^�]ÿݴe޸�����nG����,���S���p����ǯT�a�z{{��t�a����6��:����9%�>�o�j�������������/Ow�V"�y]/�X����^�r�z����ǩ�n��(Na��/a=B�׭��]^w��#�x]I�W%�^w��#�u-J�F�#���름n�����_��~q�ʵ4����D<|��/��m]��#4uݙ����u%O]�#4vݝ��׵4�����/�����^d��%x#wݑ����uS��vՂ�f�AV��-�K,B1כ9�U��3#MF��i��E�p��-��&B*�s��;� ��!���-ײ;B^��\#��+B[�g�ݗc�Q_{���ѻ�����ug�������l.�t4��`}yw��v�D�*Na�l�	�+n�#��'Zs`ĺ���k��M,�l�((%!{�Z��ч�w��b�$Z?���q���n������O�zp�s�ׇ�Ef?��l����sm�[1g�/���ʟ�<Ԡ͆j�M3�W�O���v�o��x�R�#xݚԎ�ugR;Bnו�vU~���5�����y]�$�#tv-MjG��z8�!��ImV����M)��]7&���W/��/���~�����X��	��(6���yfh��r;3!��y6�?c$B��՝���-�B��%��W-��uKb��0�x})��[���/Ӓ�Cn�vG(��sz����9�E_7�f;��*^��7�}Ŋ�Y�bW(�@Q�tx��b,�k�Pc�;�oV�Eh�z�����^3�y#GF�zx$徚5�D�H��F+|� �X���o(�辧@=ۅ�}
��Ww�7E��F�n������q{�`$q��>c~�@J�ho�H�{_st6@�,ߚ�$�w�9#I�ݙ�Dڻ(��Hc���%�ͥ[~��9�DR:��&h����a�t�:� ���M���i�T�*W������5a� A~7�M��t�������yMC�%��f�݃��J��߫��;����d���naX�-��n0IŃ�'U�x�;�4�3v��X�$]�U�`����r�J��M�����t�swSIV?��vö��>��t3��;AT7ҽ�	
������Q�4An7I���&M�)xN�����hl�K'M�_놖d
���&h�5u� ����q��n*��:���&u\�/Tt3�S;A@7ҝ�	��ީ� �Q<A>7���niN��I�B�C,��⥓�������ஓ���Mk�<AL7�	��T�u8CJ7���,|������	��n�N������݈�	��H�'��f0A�|�������X�m�K'}�_3!��e;4A37�	�ZB:7����e��s�$�-�)O���H�?A:7҄�tn��	ҹ%�s�JE�Ih�Xn�R�5'O�FH������w��c��qBA���!�֯�g�v)��]=��8U����N����1��ǫ7�����|k�2o�u�x.'7 ]k�;AP7�Y��A�H�n'�ꦻ�x��nZ����䡮q��iv�jL��dxӔf]��|�)Dys!UΖ�$��U9{�hJ��y�L�⥫UyJ���c6��Rj�Ye)���ķi�
*+�'�S:�������i��w����m�-;;�����q�	�k�ÞGݳ��F��D�)[��us�l6�d&^�g�<����:ή/[�g7�܈�q=�v/�H�M�٥"��$�T���A�
�Fd�줠�_�/��
�z�fÂ���G�	 ָ�:��4��|$����D��-��L�� �H�n���fv})�Hėl�Φ��Z�N�}�&횓��Ə�<� j��w׷7��v__?���v_�?��~��%�v�Γ*s-)�+X+3��\�"u��{�it�H������T��-��̑� �H��R~�t��E����|6M�w��/�v�ל<5��Dm�����������c�X�?�Y%�-@��ڃ��#�����hO���E�~�@�\$���YT���F�E�}���t�4L.��5;����^( 鱟M�<�lwmclw}�'�G���q>�Rtph���]-�֠���¥<Z��%)i2���|�Q�6'�f%)�Y2WKe�<������]�����f����ǧ���g��������?���o><�Quߞ��^�?\�o[mٮa��������_��|����n���]�}�M�����z�3Ƚ_���a�z�;�iC������{���5����w�3��!���C�����y�����V�*�y�����}�,���A���w���������(�w��x,���������hC�{j8��%#Qw�l�N����̓Y�q�4n��4D2��+d�}gC@rY��>G(�������>>���R�Py|����������S���E�6&��hO���W�ﭰ�z��'��D{;����z+L�gk5��ty��V�utz۞����V3��i���۫�T�o`]H��%��i��YA�p1���z ��������ZA�����hE��(� �[av�S̏�͵3�(�LNQ��
2��$���)�C��F:��V�G@���x/"Щ:A��i:���'��`(��`8i<h�N��K�sV�1���p��(
�
S������(z��l�����p��F����K)
��
7�k4b)�C���z�vw�
Gĭ�=�ށ=���D��cD���zvcу���֔��o[3Ψ+��>JBɷՌ3�)G���h��G�v$݌t><�=�����!����ӡ5$1�K�.m��dδ/�k��-���-(�n{����z�����?����z�����N��	����g���H��^��X��o+���Ëd:�9���_qtD����[	��"��(��J��
��Λ+go~(8W�"��p�JfWP�<%��o���������L&@!`[�Ԋ� �yjE� i�ZQR��T���#yjE�i�ZQR`8O�(;��z����������~� `��s�t�^�XJMQ���@� ۧ�Z�
�F�fg'��߂��n3Ef7k����iiE�}gZZ�^/MK+����Ҋ$�� �  ��"_��V$���)��,p���wd�)��'����O�}��������*^zj�����f�;~[�]�/ �k�&Yn��f���1��y#EFB�B�wlR��:t~w1�]��%B�B�w�Im�6<��������h �D2cl*x�1VO��z��zR/]��SA_+c�T`��1fwg�Pu`�V5�ɏ��cvG �?���q�z����#h���1GhtW$А�]��?O)9�UOiآ��f�sd�<�"����Fsd7�ܼ �����Տ�3���������ݬ�O����Ϸ�7q���W�����e���GdIM��oK��8�-K���-}�ِ�B�K�{�ic�=Ɗ���A�U��@��z:��1�k] =$�h]��7=�|�H�Z���n0 ��Z͢�p|5�v����}7�*�,��(K�P�]c��I"'�Ǎ�g���h�����EC�w�������叏���4Uj���
�J9�F.�U+\��~v}a1�F.��j6�Q=�5[�-��8�����v�x���}��yͦ� ᶾ�٠ ph�mA�j���ʶ�t����X�ўFw�k���Rزj�0�&$~���a�uQ�4��}"�&�Zͮ/kb��hr#ˬh��k떶���l�x�\�K�Ǒ�W�%Pd�@� �Btn/�v�@���7(x����̞x��}�zǹ��8�^ϭZv�g+`mY~������E6rdT��k������XB�w�o���AH�޻���6��K�l�J��(Q�44a�wR�Ԍ�PuD����m�7�j�z(P��a<�5,?EBA�0���e��C:���8U�H
uT����<�[V����;!Y2�D�ڊ��c���:�|w��z�@�1ή/뿓ݤ"��>4(��n�/e.T<^O��/��թ����v6�����wM��#�=yq2̱oV����(�!���8�l�Ȉ�u�G�.�kH�_T)��vo~x��.�ԛ߯���O͐J�~E6�d���x'���<��׏���r��6�~�c�#�>v��А@�x(Fht终dļn7�!e^r(�6�η����
���r�r_I��4x�"�ؘ����X�юF��5��{��f��Do-~f�[��if9�w��$mߝ(6��H��@���D����ŵ�p�F�<0��ƙ�A ��䁁��/$���}�:�����L/���
3c
�֙b��M�]=���֚�5��}g��@����d3OfXD��	м�4�j�y��4�闬%r$�`0�����ً"/6��Y��}G2���5���m�oaWx]uaO����a��<��D����-*�����q�o<9!�N4���й}���L���n{�����~��������xB����	d/���8!۷���wȥ��v��M�� ����t�M�{��m��es"����\6o��H��6з}w�}ۏ4i0з��I���퇛4��^��5з}G�}�76i�Z���Rlؙ�
���*���P�
��E��*ݣ�G`��_��>�~,[!�{i���3im��K�P=��}�@�#�s/��` ���n�_����-}m��!���K�y01V<���%�0M*��T�<S�z�C��~�rfu+H����92�� ��j��ծ������A$�1�ʻ?˃�Y���~
�_f۸gi!�{&��i2�|����.�����W����#��`!�{Ͽ�գLZS%J��L�X����nm��{����T~f룇��3%:���_fF�e�����o��H�c���=�W�lr�Bf���V/�ȃ,�lI�o����)��[x�G2ϟ��r	K"��������J����d�j{p0�T��U�T7��?�@sF��g�Á��mYn�"�jU{椀�-�Y��L��j�ꩥ�`M��Z��<�8��s�TCK2�2��F�ᙔo��HnH�g��pC��]��G� 7��7�rfo�$��MÍ���m��D�mm�ƚ���pcmŋ,����pc��]��D}�X[@�nl���n\�[s�qj��R��&Z��[h�3wn��sF��	c���ݬ�BX#��-�� mVn!���f�:{���+p��6�u�?c$�V2��z{�
f�U���Y_Px��Fy�E���i?�Vj��6���f5��d���;��F-���}z�?|��e��/����W����_p�s�aZ�]&Z(X-�,6���2I��=A�=�������6�@�L�ody#6�A���u-$@}�t6@bK&���A� ���	�6 ��U��&��o���|+��ݲ�뭈�����o��Z��~���ˋ��7=HJb}t4���X�8�cAfsP�q>�RP�yl�m;(���n.��,�`#
��Y��o���C5�_�&����T"
��p� �zaO�Byh.��o#�A��B4e���^�x'O������zdm�&S�"Z����5����_n*`k�]���ꥹ7��
�F��)-~ԅ��T��Z�� ̇���<g�_ɐ�,�9H󁭁�b��FF�88�A���A��m�P=��*P��Fk�~�B�.��2��C�L��Y(��͡L���K�L���h�. �"�-8Τ�#y>�V�8���d�>H+u���_��>���8H�AZk���Zq?4����1��Ai�������D��8��i�mq��m�>�YUy󭯖��nݵ�'����L.�!������K��SG�Im��1B]�T��Z��և���=tW�8��AT�㠼����=������I����I����eGB}k}�#����Ǒ0_�M_-ht��wW9�E�A���� G��`u�#޷#�D�[�y$���E��;��[˕I��J����1u$���]��Hq;9��;����N��_*�����J����eG{g!�#��R�b�7_*)��B(�{J�_.I�#Q�T�Kg���>�~��Ð���b"G�;�&G��7]*ryQ|�k6D}��f��-����V{f�I��|�賷�����>ucAb�NC��V�o�XpV��[~����,K��}9��;˒)�Ҳ$GJzj �f�,G��Hy�#]��!���]_|��R��v΋����WO�`e��`j��T�7TG观�9�	���h��l8��J̈́���I�$���5����5���=�?�ǟ��������      .      x���r#W�-�}ET��d�1��"�~(��))���l2u9�k@�1����S�7�K�ٌ�<��|ñ�������{��RuQ�3G���� �c�o�~Y�<��A�M�%�9�'Q�G�$���?|=	��ď�x.���E8�$����/���w4��O̣y�'a�ĳp���|����o��鲦˛�^x�����v������Lv}��뢽o�Ǽɽ]�U����*���>�.�U�y�ۃ�Ы�������j�b}���y���mso�g��U�ue�;ﻢ��7.__��C��/�ں��i��O��u�z�l}�����j�ee�?Y����_j�ۢ�w9��P�/ro]�r�4���םw��;�mS��r�����澽��V{۬���+o���]�o�ۺ�oo�v�7�X��!o���lr�N��?��G���X��C�
��OI����mF����]A������o�����Z���)��k�<����ʢ��^e;�jy�@G�K��D\����ޮ�@�-�^=u�z�m]�a3w}[����m_�}S�M��uE�j�d��]����9�,<�f�}A_.�;���Y�ɏ�u}�������(sV z��ƻ�	aE���b,��L��b�,��XX)�G(�i��h9��§�iL�����ћ�8\�����������Y�]���5�_��x�v6��Ѫꎞ�NO!��yO/�C`���o�]�]�#��^7�m7�^w���
�(I����,s(<��6�6�$��Bi2:�m�y�f������������rn�É�'�����t/����g:?����?�q��$]Β8�ӑ �eݖLÆ�ق�Կ+�j�j�;�c�A˷t����dbH(3�]���!YoIa:��m�?�2�#�O�j�Ѷ�o�5�:�i�t��]��VuY��ļ�~���=l����l#�	v���k�UOﵯ��z���[ӗɐ��L�����uI���0��������ɼ�z��+���=!�d��	�S9a�$�8�srI�`-�s�.�8J�E0�WG�b$��mC'�5�fS��D�Yp�,&���X��o�`u/��M��m����>X�_N8S^�ӳ���l��0?��7���S�<,���{��+���=��#zӻ[�l&'��e)���Oe���Z�ǈ��e�mps���ve2h����A>yKwSA�v����;:����	A-&a<o���I1E�s�8#�8ga8I��<$'"�Y�,�d$��l�����C��9Zҟ�����E�]��=z�����m���!��������=�^��9@
��tÐ&�`��Ntt��b��&ѱ,V٭��"<�@?Y*������՜��n����:�nr*hoaa�>on� ����$��h�Ї�k꼢g��͂�I,��"����-g���+J=�<����}��s��n��-�c[����{R9�ߤҳ?<����t�*�q|Ɋ���mc҈`�J�F����&t��D� ���I-�sU���$�W��?'c�$)n�E?��{����{v�JX/{��E�f��Wt5�Œgu�:�ðF~d^�m/b��Xy�e|}�MI��C_��=�4�f�J����]�t%�wbdE�����6�.�nEw�U:�Vra?�w[�p٭ˬm�e�m��$B�_�MAǛ�m^�8��UAoNE�R�59e�i�Ǿؓ�;X��i2Z��5����o�@���=X�����U�X���#O���p�\quS�ftQm)n3C�G�I',��Sxr���d�{���#?^$��#R.r���L����/�q���-�e�)����k�;��6ui��rK�ȟt�G�:�@���\���%��/K5����hh[�U#�/����`� ΓY�_KZ�z'�E�~���⏯��7�7�I���K��1 �P?B��[p9�)~�ㅋ���[��y_����#��n��$+��n�
L4S��e��������;�~�f�|e�t���ǒ��;q�3�X���c�ʽ
7"T:
��"��fO�/ZyQ��<k�t�c��緰�th*�.�
�F'�џ�B�a�c�d��
�iҏC���>�b��Œ�?���-�E��2H��,��GzK��s�+b�<�U�E[9�h!�rRy�H�j�i�'sfl�ܲ�m)%}���k������m;�G��*.��e޵��w=F��r2�xh�H~�����m�T�X$в�(��n_4����H݈攧���4�~����^�ad��1��7t�����t�h#��%=���cGi�Rq���Y�|��EW��۰Xw�ޭ{:�-<-򞺦_������mnCԄ�|��[������^V!�E�orzg�J�7&S�u�%��ϼo�v?��4�d¢uۆ$wu�8lp@[v@/�;m���[��k(n�Hb.�.V[ة^@�f�w��HrMn������	�2:�m��"��]�R�]-��]E�m��6��l%�,�:=��RpÞ��L~�^�O[r1ړn ���r�_ ���#��_KQ��B��G��hԙ�X��i�S�~9�b�$���46�ٖ��m��B�J�,�E�Ѻ���4���x~�P7��>���"e\q��(�(��cO^XQU�C�905{V�H�mϰ��lŶms�Wm�7h��:�x2��,�α
L�A����Ii���!Lh$@2���|WK>���'��wC���&��i�IHq�b�V�\���?R���U���NUF~�������(n�����al��8��i�5]�9L����D�ƚ6:Z�wOg��}ޏb3ma�厣0gOa��iX}�s(]r�`���3u^q*�����n�o�/�O)sp_�!ǐ!��^��>����a��/�Lb�"a�$/"�m���A�������I���;�~�}�]_��Ttߊ�o򇌽*</{E�jE��O�f��d��<k�[M��k:N5����\i&���	E&8t��i�I�Fb��=�F�H�[�/�	.ƙ(�����D6%߆���h�ww�M��٧F��a�O3�[z9�m;��ي����%��}�l�dN��$Vmp�ݓ���3�\V���gH�Ѣ��=�V�SC��b�>��ć�Ŋ3\�C/q��3�}��8ū��}��?N����D���D�:�n�7?���X(��k��K���[Iߓ��A�[�fv���Ƃ6��5�M
'��{K?���:>�e�K��h҉���Q$
3Y ���ʍI�/�P-Xezr܎P<1�ξ{����("�߲�#nZ$]Zls�3����A�3�ƴ,i�(�Cd//s���韐D��C��tm��A��]��G�U/λ&��#["`�sj��{lf��Қt ��.�������6}�,&�Я��-�g��)�Y��g��GLh����Ŏ�R����
��0��ش�m/٧U!.&yE�V�1t�&���:�J+]�����42\�p�|�u%�X��4{��H��ind�4�H^%-b�q��V��1�&ךr���9��ꖒ?���Λ=9����5iצ�V�!-6|��S�]O���R����M$W-o�n��_-�ن,�C{T�m-)�!�1H�d溤���/�����~f^�;����%�(�ro�_et�W�+���#���Z�ׁ����e�q���b�X��D ��>}������/�j��ݑSL�U�ӊ<6ٞ⒌�葺Ӵ��撕7b��=o�S)4N�ۯ^�<������m֩��(*	.�@G�������I��X����kX�`���R̗:�𘦠M���;�9d/��L#&ke�f�n-�G���zC67��l��x7W�̼W��*���I&ό���?�o���gZ�
� �~�5#��;/�,Z����\�tp�X�ƶ���4&���l1'G��@M���&�#� ��٨6�`IB�3ysM�r;H)?�P���S���N˂"N9������ �l+O���M���M�{/iE����4�cq�2L������`�YI��G�ף��Q9qT|�bS?��;Ct��h��|�χ    �#�H%����w\�E>�;.�4X�$�`&�<�Ϣ4��"�����I}���o���EK���~u?l��G<�r��}M6�ȯ��lG'O�J����ۢT���d�_�����N.��2��~��X뇟���'Y�R��a$Y�֬�&�#�,���9����	?����zw�4ȉ�o�5�c��敪uٓAQrc=�F\x��D#[
 �2��!K�"��b%e�~p[�9ԠEQ���T_n��\�u%R؍��Hz�*,Jr] ɺ��f8�[zslN(É����b� �����=�̓`r�75@*_������A���OV]�d��������d��VOR�yD������y8���u�oO�s\{��M7�2E��f�B���93�L̇uߴ�Za�R���3�����|�I0�]�{�oH荤�LcO�m�@�>����@��{zq�Ѥ2/k.W����Z����������r�ŀ��u��z��R4�`^�&M&�)�p���o��7�~���R�>��`����|���y�O,N$ r�b88�L/�����t�剎C9��G�նz�i����+�	�ʧNQE�C3�v���-b��5��ɬ"�FA/)1��#�4��n_8y���1��X�) �'�V����:�zΟ�W]$�DVb3�N��!)�fd���I�Y��U~G/��r��7H�.��� i.JNr��SO��k������\��j����v9�����a�}:����]�B��~�����A��A��E��h��B?˵�d�SM��ֺ��V�)�TW�2/��٘��}Q�8C5�6Ф��;�U��e�����R�Vr#}��S!d'W�d�*SJ�)�����"K@� U_����$�Ґ0Z����%����Kd�.�3z��;��Z���������â�LN?�-������^+�h� .��W�v�F�����Sg��\SpjJ́�,�⊚*J2%�� ��`��q����B�`��_L.rN~�h���x� �1��2��!@`�e�qo��r���ب����2��4��5CF�V�bHQ+��r��B�Z�����?6������@�]X�Z	�A�#��|�Q+�J��QYԂ���(��]�W�7�^y���z��n՜=T��)廿A<��e��ɿ���=�����1fĸ�V�8� ���©�J��!�'=��̼�ĉ���q��҅F��cz��3~ol��/M���M�����%���{)� �XjU�=��r̧P�	�_����`g �?�`�J��8T���K�"%���r�!��� �98e�μ��ߗyMyd�[X��S��K0�M�k�{����L֛F ~��.�T��bT]��[	x/�D ˱@�k���ȻIƏ��0�\��!g�Q�z�(4}�5{��~�{D;� F���}%�� +�N�b�ls%�{��y0��j(�L6K���ƍޤ/��|����w5�8�C ��#{5\,���~�ϐ�6�������%�������"`�r�1�"�	��SmrւTu[W���8��O�3��ձ~�s��em��ňHK|ԝ�+��;�m��]7l�ވ���w��{����qFE��zN�@Vմ�+�<Ҷ�3h���O����
\���E�>�'>f,�%u�2H�`^M�*�����;�i����i|���>�چ��T	-��2��'�: ��bO��lOى�ә�9� �}G�w|F.N��I�X��$LgQ�|N�[8?�Ȫ��F��z��"��/x�/.8�[�v�B�]��i���o>	
q������� �:Cr�s^�޵x6�b��Qp1Ih��t����N���Z�2�����$��=9�G��w����'�-$G�aת�Fb��Q�V���J��'�j%Y�ݾS�m��3��-|��Lmbee���U���1W|]�w>��
�z�)��㣺��&���M�}����5Ű9 01'�AПh�^������p<7��x9	�x��"���b��y@>�R���Etb�t�''��(~�k/�uP����ۏفK"��f��������aD��������K�T��i���<�4�/����\[ś�1[`ΜNTw��#�b��s"a5�x�!��[M�Vrɲ�Q74A�]^�[�:+F��9H;0y�@�y��J&��0�\=�,L�3�B��9N�@�;�g�"(ë��4���M�7`�ܱ�����n�6e���{��xr��0�Jf�n��0WqBC��)JS�3����hQ)������$�hiU2��w!���0�	5SJ<�������h��Ň�xǅ��Կ����0x5f�݊ �쀆��kV����V�6܄�wFY7w�%�j�kҗn���N�u��K��طGVJ/�5ұ?-�dr�z�6k�P�#L���~ ��~���!��Hƽ����d�2��8��3��7��&�Oe�~G9��!c:�<$a)Y�Ԏ%�S8Ol�T;��籉����-��erf: rXDl#I;��^���
�i�m5.�����FR Se�/N8G����{>���y���M���"��p�m�/u��O���V5T�=lL��R���a�h���}����oL4�w rwt� .�Q"E{�����l���t>8;~aj�*����NWF����ȝ6;�{�h����}�撞m���jZ���O*%A}ow���������{�����`
���w�F�r�ƴ�q"�>d���A�	3��υ�O��}�����
��E�.�0IAh2��I����41��mHTҝV1Re#l$H9+�}`�R;H:�bԳ����+fՂ�={d�{����L���6P?
/3{cLz�u圿yp�K1N�%�~�T	�ܠz��! �$5gQ���X:-�;�Y��AN�/v �p(��;q�H�f����U��������(kСM�%�
>S�$$�$��N1��[�d��������R��X	��6�A2�� If�J�J�����s>� kӯ%DB���;ް9t��=H.���A(V(��B¶�ڶc��V�nFn�+ѕ�	!FnH�2G�rd�N HR^4q��Ozt������ݰ%p��Ħ�w�*�H"z�K�gL�(���%��4�>L�B��!kA*�䵲��2���3�#�9+ i��KQ$���5���<f�	p���0���ώadi&dn��v����M����mA~�@��|�h����_ ��S���\�����
��1͛������9O۱8��1�q��s��D7��6�w�$m/�q+>2�ii��+��y�m6��O��0��N�|��Փ6[�,�ϸ�O��C9K����]I
��̀>Q60�OI7
�$V[����#/'eJvL����}I
��!G�zv~6�Ѷ�H���$�U�Lռ�$f�h��y�gq�"Re���=?�v�!�w����x�����;aL��"̜������Ђ�M6IBN�Θ��ј��b"C��~
�G��y+ݱK�Ý�(��`9��%���b��K�r����~���J��Ug�dRD6�����|U�+y}�����*8�m�@�u6�8����~�vG`����8���^�����'���op���(�q.�a�ZJRSEX<�X��c!�ꔧ$-CL�G�d��c�s����$x�;R���:�'��wB��n͟6�d7���~_t#��CAA�~�yOB!!C,�MӢ��  �Z)�Y1�w��+d�%���,I�7��#9�ǻm�WŇ�O��=�Գ�/������YXȿ�]6;!5}P�)�����J/m��S��^HQ��p+�#t��y�����࠯������oz��曆����Y��$����W]�������ǡ� #��DVs��cx�Y�2�y)�Π�$�쐚���_���G��2�����fc���n�Q�3�T�Rn��������䞖���܁ ���~[����o����z%�v�7�3W=��-t̻c�r���M~��XX���Ez<    ��)�a�������k��U۾�f�AM˃�`���6��) �}�=dn���r�����Q����H��g}�s2��*'�U9N���]��̯�j�S�� %���#��C0�Ϊ���ݩ�D��Qk����y_J��mqG�8�'�V�1��K�~�r���U��f����(j{��̰"J�=��>'�%I�.���nȼ:Q#��@|��dɿ���L���L$���7���4��p�p�1���yn�uB�W�e�#�iLA_`,>\��&S���ֿ$F�g��l#�h�=BfW�NûDVCX�/z0��v!H^Su,*�r�h������y�#�x>��;6��;	���%1�,�.������	������ד48���eH�L�$��!�tلK�3�:���Z,
��΍*ݕ�B���I����iWOM4:�r��OQ�t/爊L�b�\,%X�3[��»~��d�b1�;��1�3�P��ow�S�w?}zK�N��"I2?�r&�}G�}�D�A�	��H�a��3��A��r�@�X�!I7	��d��t9�i�����Q���Y����Z�aZ�i/L�Avw�(�CB$o���]�(I[���h�ٺ�-H2�O7�}G��Xe�?(�!�nÈ��J#�Ҹ�7�����s,��dG?SO�]�[��q%Ԭ���.t�v��၍�h�3V��z��KR���c������F�ݪg޻�3�G�=L_-$w�)���JWz��q�ޡ��e-�CW5g��r�@R���)��Ԣ���V9y%wy�>bj��,о�{f����Iʑ>���ד�ꌚ�VMn��g����e�|�E��Q z�d̐�����c\�˦�kfAO�,��jOm�jS�MIS��骱��̻�moQ?m=]3��Nz4|ǆ��|釞���tqeE�jq�ט�a��-*�wE�'�� 1�k?�n:;��8�N)� 0ـ-��+�r���p�t��*K���3����X0m%�tːY!	.@�{��7��G����3#��;
�3�bt[��� 0�rS�m���B��ڻ�&ƽ3�sI;ĵ�G ���v*~�p��4%O�o�v���*'�x�j&�蔬�M�;H�ן�]���tu#m������h
�nTB�3b�Uld/��c���Es����%5�'�7�o�9�=[5�(hz�eĩ�X��W/J)B�J�g�؂Bd��QX�eh��%o�:���םKQ�s�}|�ݥepz��c%��%�}M��E[o�K2�@�7���\�J����E7�~���njVj-��n���s��ʹ] �@����ܭ.�Ұ~ȇ�oN�6]K�N{#��-�'�A��x8DV"%#�DY�s��M�s��������{̻��<gd��\��l�=�\Nސ�e�:$�dIa/Z��\�I�e8T"4�!��Y��k�Q���ٜ%�`S�s�/�.��e�Nt��n�oc-$E��#2�-��LBA�b�i�)��g��dҚ���b_Bpşĩ�<��r�Ab9a��G�ߥ[E6�RC�[�͹{�G�ĳK8�"4��pPh6px�H:TwA�uV���f��K�lг��"C�pv��v�޼m�b1ު��n��ʇM��va�m�xs�2�D�����˺��,z�4
�
�d�,pR�}�GS/�C����=��b]��U8����`�=�Qq��2�n���2�mk��m#5�۶ڌOP��u�T��%]_=���GJŎ��B1�������cZ�Nc���w����}�S��,�n2�����e�7���.�yWS46�6-q������g�)��}[�̳�v���N��p�}�n_3�"��'{�%[�(<�]g9��f�IO(�8n19?���n���-�}�s��}{=>����o��푗k�q!�xw��c�zmN�ծ~�H�ïGf�� �˞������It�$����t�7,&l� 3A����@����7.�'C��R�j�oh"�j`�A�Gn:L�@1��7wh�@";�/b?%,g� J���d���� ���v�����.ƹg���~��+��+�Y�a �:?��)��k��� D���1����p�����C� -���h�Y���2D��*:�j?U�	ܒ����~��]g��G�5��!���暼�����}*�Y5��qڅ!4�\�ĺS*���O��H����M �O謑�w���&o�q�ZM?Y*����9zF�~�ֻ���$������W�p e.�Ip׌#��Z2�d<)L��0鹵2��B5�d�.LZ}X���&hBM�g&0����ܫ)4Ns[��94�9oF�U�`֫N�d�t�d��Vz��SR�B�f"Wa���e\C�f��(k(���>�����U�c��۟ĎB�����y�M�	�3~Պ�n��"UGr4�OfѪu�+c>�=m|V��%��Z�ž�G�P#�l�����EL��i�B���Az;��Q:��M�,�	���%?���4�:�0�$�Sby���E�Q�#�n�FG��v��,h�0�m��Gi��o^�Rϛ�T1�
���Qǝ�D2X�V:��D�$�2O�����ť�%��{sｦ;����"}A����u��l��i�f�w��i6����︱��[r�y}��$=^&�3Ey< xN��أ�Ek}�I��2|њ���E�|�ѳq�S�mN�&�{�6V����}����<�n�x���n��|3gi�M�t�k�m�A�\@�>���xx��DW��ț��狫���|Ɯ�#5	�e����O������N�\�<vo0�Ղ6��3��³�쁡J�Y6�A��1!픆$)��t�0��޺��C��2��5�g}�M�p�G�S�}o�e~�	�Fr�l����`��-����������jr0T<��������9SiN_ݚ�u{��wDYp�9IH�mxP0g���6��r��9�@�p����@J��4L� )2��Z��\�"��T
w��K�܊��kbd�A�6�)?~�Q� �ɓ�Rf�� �6�N���}W�ߑ� �{�<·��/��R�,�}��8o.�������x�(�
��תl>���Q�:{Q��cIO�3�ΠE0P;LaJ�߆��ɻ���z��9�f8b�9} �O� �O�~��Q��?L�����o�$��v6t4w�yj3F\a�S����u(���/�8�\�O�Fw�67��@zI��XR3t���Ķ�*�r(^��`s�`��P��Jv���p �r��p\`K �m6:x_�qz�;�� Il��7����U��2�5"�U�tBս�3Q";q�C���y��0J�<�<���:g�R��d=bz4�vr����Ϟ�Іl���.f1�7����[��m^����>n�M��d'��`��wh�_[���]�K��bo�^��� k
 -%���5S��9m~ES�2��P_�firs���py�j�ҫ�9����J�W4���9e���T'ۏ'c�ut\�)~>����1��*�
����y�7f�g�0�����?t��9Z�?��@���,����ዛ&{4Q�D����H�:��E�-&M#
F�y�K7�!�����"�VzT�J\��}�[0-��vCL�l���^q��St�m�n�]Mj�N,^��'pf?��/��g��	�&��7Q̳r��$%�k���
:l�-d
�j9��WR���O�*E���Ydh6 �A�tp~�.��1��x�̳Oqf�����Pn#C<�H"{���l|�������;�R�J`XA- E���  8�f5��Æ[�V�L�����A{=��t��ޫ����Qӣy���_�������&�5ؠ����� ��Γ����BP,�/͖�+��B�Z�>?�Zvz����q�-�g`{��l�\�t9n�U;�Y.c��?�2��ީ����E��l#�������Dv��s~4�|6yӷ-������'	9Ќ�n�Oҹ���o�O�(|^D:f�""!�s���2	��,X��HDς��+�c��M�    �Fr7��;dx̷dg����I��ف"�m/�s���
S��
�����3r�7Ұ ����F�L��0�i���J��U����,G\����g��w����{�?�\��v�)�ǩ�f�����ɟVf�_���پa>��q$ll�C1@g-G-������u�8�.�y}sŹ���j�&G��4a�����s"rH��~Su���]<�t�Vc �¬�2#�d��~��F�}}�s�wg'~� �r,�(	��(�F-���+�D��i:訩N��L�k�n�2@�:$�X��c���L����+vB�% ���a`4 E.�.$ˍ6��l��f��Z7�xS�1|m��ᘗ#=d�{!Y�ԷtRЭ�3$J�q����gL�a8Е�t� 	'I�k�_raHD��:�A����m�9+䎻�t�Y��TgL���[�^��
E}�4�����-��0G*τ�t��ݴ��2�$F��I�BՂ�λƆJ�t�Q��g�}S��jQ����j̃f�B��I��P5t���D<�'i�"�|
+���_�����AJ����H%Ie�v��~|�+���g7G�4n#4{��4y��L�J�hwd�e��f8�p3��%-�\�6�uj+'R��m"�h������;X`����KF��_��}t-"DD���%��1r	f�s^|���'q����1���S�=2�tN���_�d��l_Gӵ-�T/�M�	�?}j��e⑺A���Zk�F���8͂`��i�X
�d�Ɠ]�Xv�2:l�����E��:g��S���(3k̷]��ܔJoR�f� .%�љ*��܈��ҕ4SHՠ�,]
*�+���Sm�.�ޣW�$���pW"]�̺��mzGZ��t�GT�gr����`���,f.8�d��6s˟�҅�o!H�|ڱƃ)d>m�����iӷف����iy�-|�M���Gm�&���5���ab�~�aYm:u2X[�^�W&f9y���N	�hֶ��p��b@s�u��S`�.��Z��\2$�b�n�Jf��XD�����b���Lu �I�|�9��Opij��}�Aa��4����e�n��gjn�(9�+�K{_2e��W���"�X ( �K�����my�lŽ4�Y�&�ӓ&���ۑb,��c !���ˁZ�0��A4�ULj��$�Gk�4�X!���d5�6~��r��� �s�Zr�����=�:�E�EL
l�\�vc�8����n�,kvJ�X���w<D�l�?=Ja�Tr/i$m*���]xc�c�[�q��4�qha�k=۸�̞��Ch���<�/3p����!��)#��_ľo��-6�d��� ���"p i�E���%��<]΃d��AZ�Fh!���&��(��f�2�+){o���َ e�)s�c;�m9�F�D2��|i��|��u%�'SwL�����⒌�~�G������^�dޒ�)4�'G�I���'+��i+dy���RB��7��=�pE�R��{�w��h��~���Jf���3���*�Ij���c�w^,�;� ��}��6��o%��3O]�e0�R���	bP�YҎ-���	��A
��G=��M�qf/�5z�uٓ\�@8���?��5(��H�A$M:+xI��U��;`$?�^&�l4�w��/�!�:=�d���V[ox���&�00]�dF͐pZO�2z�us�~�Җ{����a2^��mǥ)M��������-�s�����&������>��+�OL&��#' cm���y�5Ȝd�wP�a$��`.�ɗ��������ޙ���|�������F�&��aI����X���'����� 3�H���ۈ��w��`N���2���a�K)s1�/O�f�\�J��W�u�����C�����#�|�;J��</�� �.M�;"�9`����w�*�L�+r�~����'��͗j���Q��U~w���EClf�U����o�Pm>!�)]/�P�0r;t"��}�I�ǰr4�Dl��[��I��"?\,CF�X��!�F�'�kg�=�����T�oi����J`&���MӐ��rc��1����̣.E�������#�@��t|%6�MG�N�%s�G�!(�a�-ΕT�g�.����':��4��u�vK�-�����`��o��=ܢ�#������fI�]�u���u�s||^�b����ҟ�
Tfs&��I�&h���\G�+��4�P�.ԃ9���-������o�i����%������b8m����M��kl�c�3���K��:%&�@�?c3Z)4l��0R��>��P�K��Ih���С�Glmw�.?���ҡ)�	�1����n� ��V�c�Q���T�S'C��03X:T��bV���7�ZS4�z���H��`�Q$�]�����AS��[���O��E�&j�$�N���Ԃ�1�!���l!)]p�/��,᳂�"�ٰ�`c)�|٧��^%�6�s�˕�3ߴSN`��_Ҫ�J��������H���TCŁQ������y�%�;��))��Q�c���EdN�(O�W���4�n̜���G�*�A�u`�M���@�O��� ТA�{§]L^o����ʎ`A1��' �Q� En��')C��LD�gr֟7���;�#Qx~��\��wLEY��p	n��'Y���A�t�s`�g��GH�(��lCo����~Cﯔ�$X��A��n��E��.Dȋ�D�n��y"���(.��%���ؠ*:���Q���p�X$�0���8����XQbC
']��<I��"���,�B�b�.������i��o��Y��I^k��$1�Ʌ����ɿ`pJQ���} m��m��l�t��W|����L%��	=6}���pnn��$2�8�)��R?��l�-�N����t����5���z���օ����b �w}�;�������7Efg��:�=[d� �4)��p�^8�K棸te$�Ƒ�D����yX�ό δZL��4f�d�'�/���짗%�t����?Y�=�u�P�����L^���m�e��3�&�Z��� ꡨ�[ dѲ9� ��e�L	�ĩ��(���Gt������C���*?�adiR|�|�N���L��=h��ȴ��췓��|\0�B��Do6�<��'��1 JN���!��2?�cQrG��զu����{�gT]�+Q���0�1{�� �p}��a	S8�'wa�g��Q�e�iЭs��Np�	<'R��܈{���yn�_���O'�}�T\goG��|�q���8M���z���ef��Z���N�)��dQv�R�V��z�����(Gs��ھ\��+��cr%��L~ V�B�0���q�Dk0ΜSy�B�M٩������<��g���S�Y�LI -�'ʊ��,N  R�(��YLZ�cVnlf��?��e�2�Hd�X��C�L���C;��r�#�%��s9�K:���^�����$hzh�;c��!ǁ
����%�V��	�/ESFRv�1���}�jTy>t�sDy��� -�$CZҁ^X��#Yיw���Q7��4��Nr4���ˍ��H\��z@��&�F޿��=xC �h�����)�q��ڈ�p�#� ��n�2N��/�����q"G�_,C����Z&g���.Ģ���m8�o� �W��h��.
�^ɔ+������W���8_7S��O��˜[�XϾˋ�{P�:1D�=�NXN�⿾��7�ɓ�_3��LY����>o�����ϳ$��ہ�ذ��Ov�c�DD�7�<!��nu΀:o����W0+O2���y9Gz�������9��N��k&EiP1��9�>�Bo��P��|��d�ԣ�nX����q��� �V[\���1�-V�b�����f-#�\�L6�qQ�J�;�'w8<��J~j��b�-��D��̔
��pN����@�q@���N&o�~�
�b ��$M�I����\(�3�R��.���}~    �A��t�,{�����/���CL�Z[n''zy��[=���k������>:Ӈ�n���Sy���J=���af�=kQ[�d� s���uށa3��9w����E�`]����c�f��gPgʰ*�t�,Ʌ�x���\��HJ���f>0=~	<#w�9���ZY�0龓�[���zӂ)����0�μW���� !�<3z9��W�pz��A����k8c/�F�W�J^y��ne�|��U	��V������@M���?	�9� �åML�����2��r%Yd�B����rnKq�I;�dCk��l���󙠚k��b"	�M�uG/ ����i����W�ɛw�|+�� WaBQ"��9<XT=<χUg�М�<|�Կ��AҽR���h��x<D�v��{����;��#[k�Z��mj����q�z$�ؓ>Kt̐���f�3�p���\ԝ�4JF��Jrk�Qڗ���LYŌ��n�J�y�L���Ms��t�`�zkZ�8���&��6�Ͷ�4
r$�Q�&L?�-���y�Z��g3c���^d�e�<>\Ǧ3���"�p�os�ԗ��{EFo�N�)LE���c-��EZ��0}��;��vQ3��wtB�*��W&�6�\�8��E�<���&>ƟR��-낺$m�7�������9�Q��]k;p
�fn�ܪM�D���В�=ZҐ#�N�I�ޑ��E��jҎ�XJ)��b�t�H��K�2b�.���>�k�!u=3�:2�����s�B����̹5_I�5��������=#K�@qB�Ve����Y�j�5}/c5H?S�DTGQ�����>�����񾪳�	5u?mp�7}V��+L�7��9�3Ϊ��L�|�����鋙lj��6��3^�c�ķC�07TZ�3fz�i�|�/G�ϋ8]�g��$�?�Br�&_dA)�;&K�U\z��"�܀��`�k������}�Ň)�B���}�xңo���d��G '79ȍ�����H��D���G]m��ܙYa��{�Eb��e��PjT��]G�������w��|y�����w�Y������Ȉ��-�{��~�MN����a�0k]��e�H�`��tD���&�bI���͞E�"��m��I�P���z0����&�U�S����[������9R�:�SZ(>�A��^�-q�M3�2 9�XW����Z�W-d�nYZK6,����P� �*Wy!Cc��":�E�0D����і\{V�7��L��MD��E�U�P���������d��`K|?����\�[d�|avU�t,/��$~n���5���-!�~c&�_<?��/8?�z�e||�Br��� 3���x�����T��WS1�oS��	ᱤ��G6��r%eq��׆r6���'5���9pg���URѕ�;�M��]�j�]�CŁdzE��1��C@�
��tkZ.�Pie	k��L ���U��5]��1p6���*Z��,�c5"ߜ��ҁI�����qa��<��r1��$9e/F�(�=��.��ӸqH���Ʋ�M�W����଼Ϛ�B����@�1z���W�gEVX�����4�B -|�o3L�%T���j����<Sx�U���CS!�?�|Ĕ�fg��t3V��z)��r��)�[�=8+��
�e^�$���dC�m!�`�������L�N��HkP���
U�Ui`�]-S�kmWr���M��)����I�5q�>���tt7�|�<
ɀ+��i�8���+�XY��+��
���퍎�ҷa:C,M[�ɓ&xwN[�[�xc�V��#몭�evf:&�?#�����l��׏pI?�7
��>DG���GDY��?[��O҈�r��gJg�N]U��N:�c'�.9�ٝzW�yv��z��?X�䀱jW��jS�ʅ�.����;s�rhw5�*��K�t�L����jf�3���)�f�D��N$�,����޿䝭���"i=+��J��.��oO�,2���9����cmh\�ݥW�� �Kp�ȉ�z�w�5j�qLZ�#d�!����ca�qw�Vum4���g0�fJ�2[�F'.߼$��`�Q�`;emF����&��%��)yLz��� ��ngE��|]� �^N �ױP�R){����2��G�2<�u�hЈ'i��0^�Q0K�@ �s)pMY7}�ݙ��$.u�,�U��1�gL�j�I�����6���5�]m�jp�P7m�����sNR��Ite��̔k�N�"�Pl��K(�Pa���=5C���mY)қ1OpJ���L������NI�#��{3��r ��/?X$R���s.tJ�����$*2<�|�G�$��Hh"��eM��Q�7vTa�Q��_�U`�p��q�+I\
7Ә�1��h�L���<|]x���c.�A!1��/�|�q�0]����ܗ
qh3�Dܴ�̠I��J	� ��}^M)����a��a��8���Va9��9����R�i�ٍ�$}�u�=9���ԡex4&ܙ	?����Q�Lǃ�D�/�ǅur�T\�V�t_
ԈT���>����|�C�>��a�k�s���].�@�����E��	}�&޻��Q��	7TKw[�}�6ߐ�,�$����ڱ@L�$�CS:�O�S�Z
�L?_�'�� ߺ��'�q�Z2��`<d�̻��0����Rp���o5�8��ɜ�ѹ�y=(.�'u�a��kR���w锌�h�Hj٧�h�ot�{e�s����y
3j�}����y��
�θm��<7d�R�1�{
�w�4����Ue�'?��� ���.u��e[�̅v$Mu�����gq�ڭ��^����Ѝ"4W5���G��3�')�=��>��κݓti�*�M���Y�F��b��聆$�r�8�ڙ%�����*dQ_��s[,M�����H�	=̏�Q����PWU4�T'�cN�}�B������Z;� 5���Ce��U��o�r9j��d<��<�B�9�6��x�v����Q������N*/9/Ud\߬p���-�=[6$0��Lゲ�
���]k������f�:�0�����X�2m��+���`5<C9����ʨ!|IPS7 �j�u���� ��ca��:�J�o�a3�x��I�~
b֑0�S��:�Ή6����iD� �'�<���"Q�!t`hmH� s	;�i�It���/� Zq���b�!&1_-��]���0í�u���|CI�Fpy(�Q{�t�(�`l+nN��稵n(���~"]BR ��t�)A▎Q��� ��}��9`=��)��Wi���+/N&K��� I&1�u�--R
�O�O��x���y��<��},�	3�*F�_���Ot�����
R4�X��p|��h�e"�q0pS���EaS������s�h�U��^v��E\C���8��S"�J�i\'���6���>�S�1h8`E]�=�m��|�\j����ԃa�D4秉?K#�?z~��לW�n]�7���Pו�%k�	�n�F8�\�JGt��Ѯ1��#�u����tH�9R��k����t$ �:nq�8��	��h(T�*Z7'�E�V�>t@��>[����ۼ�{(����V/(���$���+~|�#�Iy���#{�l`�90�(�JY��ʙk����gu�ݕ��͘h(-~����y
4���oe�%��T/J�nb��+�������\���8d����IM�����tez��j�^W�M�P�u�H�2�͇�B�Q� ��#�̧g��9����6h�yr�=�Y#��<��fz4V�B���0>���Du�A��M�b�[��2��e�AW\3v��:D%l���@�b�����M,/�q��K-Lk����D�ֵ~�h��bh��bH(35m�(Y11A^=��w%�󃥈 ��g��.C�U}F
�~I��1���L�T��l����T��A2�]��YtK(gȶ)ʒ��Z'����C�}�=3 ��⣠�x�z��4�����ϡ6YG���r��    �1���/Sx񠺳n��6�G㸒�h��y>Nl�\��yח�����6�%��9c`7^DI:��r�@� a�"��J�����I�/��J�8�"�=H�|���SQy���[�B>���Z.T��x��@Z����̻�[]�n2�\�b<��������+%S��/�7W� t`*́4�er�������9��<LE9�1�1K�����5�\Kg7J![����.vd��ccu����myu�����G <�]�����锊j�N�����}Mit�>�Y��ntzs}�Z'؂Mr�%��~C�7��+S)�loYrΜW�97g��8��L��y���|'4���G�T�ys�Ҝ]�Q{6�Is�aЫT\
{:�CàyT�l�tg�i �^}?���|��
�D��{� �O��@�u	�hZ�-&O��,ӌ�%����򿼽���������΂�32r�r�@Z�>ضg4o��Q��ML���]���D��i��c�鸹eRP�i���d(7+��K�N��E;lM�ݯ�b-R̛�l�a���/�A��
��ϝ"t'1y��)
��S$��'&��2��{b�p<�5Y�{��� [���l�<�^N��h��&en�n�d�d�iP8E�lkg��3�,S&��[r:�jC3���x����=�D!7����>q��:_�Y��`-y(@��.1h(�]lĀ������J"4��K1�d��<
 �2������p�o��!�˟*I��]���;���Ԍ�#�L�]�3V�LiM6�a܃��b��;l��Y!4��+C��d=rK؉<-Q�*�:���1-�N���Pl��U]�A#��@p
�)ṯ�ps�/��P ���Ni�M]K������x�������C�@^xYP�2�Ә�j��B�XC9��g4�*x�Y�)��#�m��N0N�vL��
����I#�B�*#�]t/ȯ)�-b;�bF���9��1��bu�&>E"�����i�nV}�5K.�&��i(�UL���d���k�ؾ���̓
0�j������.
��o��g^ֺ�}(��''<��nC,ظ�RKS�'Y�o�J2!I
����-H�L �]@Ѧ`���F�y4$�E�)����`-�f��L�Ř�.c��q��
����J5�ɘ*|+�1ڕ���Uq7K13�t�4�	ֶC��n�C�_`g^X>�;nl+ z�k�	xY/�L��k��`�}�I'���7lR���h��*w2;.CÖaSj�n������d���yr����*	�1�/�8��8�d�DESt*C�ҷC|�+�:IVWȗ�K�D����p��S�r�n^�*Z���ʄM[�t`�g#��\�ڂ��O�(����E�|#6��o�����ϕaX��(�QR,�q� ��^�I�;���<�;C ��Zh߅ScD�x�)��>��X+wZ掞��l��?"O�� �`��&�~�����h�"��H��,NAL᪑��5��.��Q8�޻��Ŧ����
q��[�6�0ղ��gn��1!U,��f��L��*���h�g���\|f0g+�����LMg	:cӏ'qt�K�n{ ��~�3�jxE
Q���q@�Z�&�(f�ψ�s�̬n�K��iC:B#���
��j���ʞ����1G*D7��3/~��2��4]3?�G��=`c��=���SH��Ly�`Ѡ͕2?�f��3JLv☦X��� nL�F�������{t����I�h�6kӧ��+���k���0��Ea��W�	��p�v�����Z��p��g�x"swMnd)4d��$A�/b��Q�.�YR2�WS�)��"�NE��&:95Ad�� �,�*YL���V�hSq9Y�+��+48pu��6/����X�;�c�@s���H�$�3T{0������{��#zt̟��W�[[�|i"�rU"gAv��G<�UuSF�K��qh��5s���Se�?�B�3pK��|"�e�o̬lN�V�5�;ND�������l)U� �Hb>K��e��t�֊�l���Z6�s����c���Ӣ� �)�v
/�&{B��;"���2�	v��L��h�+����xm��A�<Y
�՛�!��q�{���0�D-�r��C�?%ʠe-פu�7i5��˃��r۬n�� �ʵ�3��=��sn�_er�!-fر8�6�#�$�Z�CFA�'�7�3�I����^���qA��F��f��t�dM.
�gӗ7�d�V5�b����ִ���W*�wv��$ޔ�g���I�m�9�V�6��(�;d�dh��$���F�x��Q�`��t�)�,�榔�y!���{�@|�*�&iR��6}-p�S&C0�Þ���0'�F��şT�pr��(���o ��N�pH�L,$/7L�I}܂�qV�Ύ�~��{�^���z̽��5���GH�pZ�?ǉ�N�g��-d�98�z��Wj���ЄvR����u�1�l�#^QN��fg�ʘo�h��)�[����n���R+�����	W��A2=�:�(ܪO�~F�H��y�����@�_vD?��M:�I(_��g���^����Bx�_�a��L���*��<zt�]Y5������8����&�����ɟ��8R�E쪆���Q�#�wbTS<�Xd��,�����('f�8�s>�)���U�4ܫ�6Q�
��>7�K/�$n�&a�t���[�ǔ�@n�;�75c��3�ͅ���*�
��2Ү�l�*�ޥ�ӥ����"=q-�S�$*
��;�f��\�$���i|$��1��y��*��8WXF���}���I�<�3 �Ӂv�
8��|n����R�IƩ�l%W����lӗ�6-�>��mݬk���x���?U���5h>g�N�O�4��N/���}�"�LFu"0��-^���l���|a��C��R����-�qH�)q�V9��6H0ea�[7O���V���-�$B��	�HI9ȏ��g���-0�.'Kp��:�?Q.�8�R�1[o���������
;t�"Ms��Xn��R��G0=���v .C�i��$,�t��܀ts6I���Q�MC>�;���!R\�&k=eD0'\��[�,҄�Dpm����ϕ9Z�+�[���7�5/e$�x�܉�+�(��pj�(85���HR�K\b�BF�d��vУfl�	�чKϥ��b��i{�M2�����l���������U1}�^M3Й^��~n������&�՝v��B?�t���70L�cDoF���&1�e��5Y�,��8�{L����=���K2���-4�)L��s�Y�������?�z�z��D�с������PnJ�ڭ����ݪ�C
L*�ڶ����׭)zC��Zl���L��*#=��A�x��6���}��_p�}���y ^ѝ��}˗�b{�G4lZ��1/��Ϗǫ�&��$�`r�.����Y��0�����O0�؝0J67��� r�>oJgفv�&�/�l|K�4�V4�~��HqA	��w{Ҥ�A�QK�q�F�В>P�L�c�)��=.�IyfH�(�����k��I�T�9�:��l���v�+0�*Ԏ�w�g�7M�UWLi�q��7��N�n�Jp?�6�WKA9������ޗ�A��&�q8����#����y�2B�Q�O�Q��jRxK�O}<�t"�6X���;ŕ��]�d���]�DvNh���w*�tL*W��р�H����)�(�N\��mP��c4􅢶-���QN�28�����씆�*��fTs'%�f#��T���#�I�!p����;/�����͟H<:��s!�dޠ�j�&�(�"+2�K-��W<%��H�Q+�-0�,0�����Ϡ��u�_�0��:M��aW�m
������l�p՗��3.NGY��E'�S!�&����T�TO��-��G �.�ɨP
���ie�i�jp�8�e�B�w�q
ۼ="b�Y0��R(�p">Z/@��֐�����~0�k���D�,gd��
�(���� �  J׶�����b�x-?��ǃ
{_���x��i��/hr0�d�m	�ce^��:�˩��yI2�W�����@+a�4�����RB�
:v�h�2Q�lnx��@?5�&�"�PذG�:O��Wa���Э1�3��.q/��i6�j��%��Z�WĬ�E���XCm	�kӈo2~�
�����ǌӭ��š����!��H�N��������sw@㽹�~����~,x��h�<))e��8�����!�h��䄇��$�8�����"��_I�|��59�:w�/%���p�1���tY��6<�.�E���a�MS�9[n�r-#��W�Y.���LR�juՅ��L�W�
u���<I-0���M3���Pԃ�`G�T$Թ�	��z?IN�݈E<�w�q�]{X�KY2i3��Ĕ���B�:_8�B��_<��8�5������l,�:�vW�FMI#�u��y;��@�5n��%1K� _=]A�P����p�	�Fۄ��c��S��wy����32�?J�IS?"�vC&@~)jX�A>���sj��r`E+�tI�xw�9����ߺl�^�Bĭ��_D7�E�lp�a��t"�=� ��tg?�H�OKئ��a�{���V�H����:H� �]�r�=L�ΐ��q9U��7��#����d��,�͡/s3 Ď��A�\e��B�&Q�� �c�^�%&�2���`�.1:-���p�{�������{B9",��\�Q��Qy%�)���A~�uٚ�VI�du�}�cؽ�[�ID�@HՒʚJV�Jzw3b�LN���[ ׻��G��2�fh��"�`d���	�sP��I��!��H|��=�x&B��Nb��aH�a���E�0b!Yu��o�R�F� ����g1��GEjBo��g��e�؎GtC��[P6��˅��@����KQp~�J��m&_�dP{�Y��g��������n3pƩj�����?d<��	O�AX��QQ7o�阈K�#�3��Э���/�m�/�ᅍp�fR������E8�=�]{�󑑅9���v��'� �҅�K���~��l��<X`�La㦨��K�\Z��m�n�~�O��H�������?u��E�"z7[,�W}�U�c�1��/*�K��/H�4>���>�4���4�v���u���F;�d�y�NGA�F��r�L�c�pϒп}ڦ� mzl��z͡�-�3�kF�8����&����yZ���ˎp+Q'����SW�f��=\
.�l�Uᖬ����"�e =G��9���J���P�1�.�I=�P%���!����dV:���2@����p������:Nd{��dƔS�O�i���Oɽ
��~?}�3��A���d�Pt���6w�1��t��*��tZ���\��|[L�`Fӌ�l�dp�ԄhG�Ż�O�R�+ɲ@�$ɒ)�-�-�v:|t�-Ixg��.�0��t�� -z��7��v\oژ��v9Va<��o%�y�~oi/��G;�d��S焴oj�u�(�ݲ�lN�C�v�2��d]�v�|Ԝ��ݪ�4İa��g���NN�m�4x������k�!�%-��p��)�ek�ͷ��~e>����d�w �̓�f�i}�=� <�G�'�kZ�*�;���U�I�D+*��4�/J%3^�2)^M�ɷYy���&L��' [�0��;��=EsL�J1�t)�.HI�Q=�i-)L}$	�J��@����$O�k%F ��c뎧&L���Q�0V�`t"_�2]�{�0o�A�BOl�D:m�`���;(˚EpH�t&1�v 8W
y~�̻�y�X6tx�Sbx�m�fCs!@LC�דS���KN�%��GҬ�Cf��!6fı�� ʼ4V;p$�ƀ�yB��
#[�L�m�\���_zNfd�hWl
���o���0RHh4��͝Z|��H#��m�d\g�u�1;cOGD쫲W+�x��nQtlF��{�	u��oi����XI�ӌV�D<���=.�� 
���Q�?cv�*8X+�2"��aY���s�F������\�jP�v_�<=3�PH���n���Hf��=	~3���d�!X}���]8CAF��AQ���D#��$x4�xx�		Q<E��]���K�࡜�v0�#��nKئ����7f9,�U����e�cď$� �]�nة>ç끹�3�H����B2`�����2�ǨUZq���4!�m��A0���u6����L��ké����Yˢ:����+]���8�4��@�R|����Z0xi��?���c+7��
�=MWB�?t��S�&uzo�����5�cSh����TgB�|�	���wԬ�:R�(]8޾*Y�D����Q2���1Bz���K�p�s��Oj|�<��B�#/8�g����j~�z��ƀ���peI�i�2�|S��3��B�:g=nv�v�U�j�p��6���/�b��RC�@��E0���3�r$��wd峳�AX�� :b�Q��C���{�>�Y�"^L`��R0 '��P6�� ��%+ʫ|W(��g �bC���˺�����Li���y��J>%�"���KB��
>�՛w��q�����,+<�*���\2�]�i�ʑ1�I��7v_d./�J�Eb�y�Ѻm�?��`�IK&�X<�O2���d���z�`hL�	E
E�w�I?��L ��hϙ������>W�������<�ԗm��Y=�N�@�ߒ��ځ�H�w*r��JN����<�f�l5d�^������>����[!$��4���ç���Ӯ�
Y ����)�pm�c�ue9EbvY�jn�v�TK۵+6���Z��6�#]5�/���#�ڮ�\s�,�pB�֕�6o���d*GaF!銆�|�+!#��+� O�ʊV���Pf5C����Ԅܙwfp.���`�ŤT�����9x5��wbm_rX��_�W�ܸ��Ff7��n*�	�sR"�)Ͻ5ķnLT2��:D?��y�*��M.��m�"�A�C�(���=��؟��\�����#��~��?��:�'c�0bګ��
�u��;��On�es���Ҏ�9��-7�����tD�;��6�Cs��k��^��7��_ǈh�)��N�^��y�}�6/k@��� �$���r.C������w7���ʘ|���^8�b��C�L���@�beǞ�q�V<���H3�FF�i@eXǟ�]����'�*������ͽ���w��$�g2�3P��~�����P���Wݵ�4��_���`�K�\ Q%-�E�� ��������K��@�y߳3�R��x5*Z9�@��F�Fꭐ�����a��q�N�e�ٟ���˞�Yv��:���I>9��Bo{Z�Ey�Y��wYڔ�G~�11�쵴�4�.���S4��\_����_O�]��$4�xm}4��7���V��Ƀ�u���E�ðI��\�:������'�U��$z*S�]"2��P�"�<����
Bd�d������rQd/���s�M����P�cQ��,�,	E�߈A"qh|}�X��R�������c�z��p�G-'�ޯ^m��(�9j�.jT���؂I��D����Z�����i��5�sk}J�e5�l�CFlF�J%n�o]��o4~&]�s1�4��Z�V?��R+u�8����g~l���o)j      0      x��}ko#���g��,�y�Ǚ$�sN�@3��/����-�l��_�u��fK�@ g�y�X,��*6�{�̛������i��Q ��rz<��7$�����n�����&L(4Yx{�3��F���-{�A�ٲ7!�-{7��5O ����<���R�����l�O��jπ��q�����?�^���<���6�ž����<�JH����`xwwz{;=q���#xCf������F%$f����������c]Sj�MNm��F�V-7��nc����mc�,H�b�̍r��ؠădCEl��Q�Q*��=e��Bs������M��h�ĺUˍ!d��jl���F;���F����AI �06����pc�F��Ȝ�66�-bM]���1�ƘV-7��m��A�m|�A��nL ��%$�� ����7vn��������AHghl�Ԧjl����Uˍ!��jl���&
� ����ɸ��D�T�J5���nJb^֪|F��Ǉ�
)a���)kSSN���P�N�8�2n?�ĳ(�Dc�f"��P(P��}���6a3��d8����.����9ZY>C6~������x||}��cS^!�ӌ����QvG-�Aٷ��~#��v��v8y�����^��Ju�T�4�q��0�����Z8/3��0�2{W�|�*������	116A��216(�(�>6HuW��R�:��0r�5��G��� 3N���f�W���Q]�
�.[��J�~4(��+�,���H�q47�9_���@�=����j!���5�4n �U&���M(��!�$���AUJ�>�B�k��9<M���9����yA��h�(�C�>:�U�B��'!��B�;'���t��J�� ��I�lA&��gj����୓�^Y�A�h�(��N�I'=#
W���O�DpHP�v�B�\�$�	d�I<� ��IH-g 3�:I�D�v�B�<;�,_���|w�%R�,QX��(�ܢP��o�CÐ�ΐ�&��cn�~�APS��;U�J5NOX������b�FQ�7�TF���F�5=�l��=��W�EO\֐�&�敏f!��z���f��p������aOI�5�TF���B����H�A�����)� ����B��g=�ST�RM8ka&@ว�kX�Q��S�SȀA���ºY����F��=�0 NȢ��,��z�{JjJ�	g�H���tM�0!j�*\ɆfȜ�,�!��ԣT$D,(��19^!+A��:��5�=_c7�Ո�H���/s�f�;p�^!7�aLrB�8A��KB�eeyIᎏ��o-7��.0�$�����&&�����x����$Һ����t�Tc��͐Pk�y	5ȶ��yw�~@�_�?�NgvT�� �5$��T��d��^Wn@�/�_��2!,"V�f��2�$/=Ԃ$Y7z�aM����_�FMQ�:W5�(t�ԓ���1ؿ����n������H�����~��׏Ԏ��KY��k$� K�$M�nh;�������e�|8�r,+i�8t���U���v?�Ώ�����I�"���ɷU�Lk/;
,���w�IqH�^7�}�Q�h��'�U�{��EZU�$�:t��Z���3���\�(���$�"V@V�Qb��¸����IH��Q��e�Q�<=><�p��Bn�����i�rz���v8?�Z1���(��Y�)I��4-iig��p1�B�B�5�a!?+�G���d5���t.�	?7 ��M�{�j��$M�Ҵ���n�Т��&��
��"�J�G��&Y	�v�\�dDaZ�:<�SiY��zH��ZP�u�9��,@%�޸F�������N�0�*�A8�U	�eʅ=���"�H=J��A�-�VYJ��*KWnq���`�#V��M�ӄg��Ҥkf�&}�����?w?��_� �ٿ=��7y�������_i�4@�I���P
Wd�I���~>��qz�	˷��JDJ�S� ���7�26#V;sD����=�OB��$ �]ݑg�F����+d}�@��O;$�<��D��P��� ��
9%-�BG7;R�$uHZ4��q��������7�=�I�As��4p�IY��4�u�y��E�ј���Kg�������$��]N�݇���xܗY2���x7ґT�@���,ݽ��}k���Y
u���)HP,P�%Ġ0��D��*0���$U(��)f �5r?Ħ�)HR;�1����@�MA�xI�A��4 � Y����j�5��cq��FS�Հ���$�����Ay��{Q�ԒT̽�n9�.'O�y	�q�9GP�Ɔ�&Q"R�/�J�L��<���[�O"L,=`5�CEP�P�ځ;�
�@vk��wf{�U?��$Exʀƥ1���<I���L�^_+p��&�|eu�i<������֩<�Z�.��s�=%�gc��ǔ�1�؋���S�o4u���#�L>�O=f����(�b���M=�Uv���Nl'�ZL=�xI�CɢUX�S�,D�i"��{���:�h���	�V9�t:^�Q*éіA��\ƒ&�]�
Fceӛa#^Rd�4����#CJ���Rdc=.NG����K$�Aã���z����<b��COv�V��qY:�衎҆��X2
j�@Ev}��a+<��
�|�Ec}���܎��߻=�J�:��U�]bc��;S7���:L��b*N9dġ���߻�����>�5>�їǷ�o�'k�D�����.QOϧ����q���������X��J++�:�fh4�ū9�)Ҏ�&���e��������;[8�Zc�݂�ds�W��Cd1;�&`mq!��	{|�����{�9�Ŵ��)� ky�F�L{и�P�:
G�tk�5�b1jQw�f@S���P�٩�Q�����.�����w��p$!� bs����Zs�R$���+�6��|�}�K��~���td)�v�y�R�ϦԒ��Gq֍�u��`~�����ĊS6dF$�r ~sS��ls⚎(  _ �kE"i n=�8�X��PP��RL*�M�4��e�ؒ�)��K��i��)����.�cGw"A���=�SL�Ĳj��J,�1%$"Rb:��.��c��p&ᅘ��Ԓ�1�c���b�ƔM�%/Ŕmi�@�ҽ�h8
&��Kh �(�.YFBA�%�PD�N/�	/�"m^���+@Q+�d(Д^���;�1�Y�:lȎHe2�v]��0P+%�^��3��8�0;�P��$��[x�}�b����M��Ba�]�P�$ٲyS
j�mdm�����C��n��y�e������y�"Bܼ�B<���#���/�}������xz�Ԋ������ ������O{��T�V�m�lWŒ�k�Ĥ3���3 �2���B<�'�VU,��Ѹ�T 6Jg�P ��q�Į��B���d�*�����3���t.*X�A�:�bU�[!�E�I�MK��@��CL8����a��Co�8�'�O�X�A��� �?ጃII1gHl�x+Ķ�?I��bɆ���]�(���@� ��.����r�$���6p9(��97����h��ނB�]w�@N
����_P
��IҊ�a1�T�5��IǢ�;�T@\���Χ���|�A��4ᘿקF<�8�����m2[��n��I��@>j u��sl�O���<"�l�t8�d@�A!��� �d� ܞN�>ߟpf;���{t��ڀO���>��Z���z1C�P/��#E�:�a�:	e�dG �4�B�Iv$�Ą|���@�h M��#�l���<��/��aZD��|�W#����a�;Q&;n�o���D�(�;\�B�?�茴��
�������m�j�A	P�j;b!�JtH (�#
�����,��#��us� UEQF �t�W# ���L.�q8��#��%����;�#\3tR6@�9��-� ����p?�=߭Mf����{=B�\���K��f�b�ہ�nَ�    (��{��z�n[��k[�kk�RX�mmLr�����q��y��*[�Y��4n+�4��1��4��� �]N�JPHGM�L�CR:QUX�e��Pv��@T�O�͗,$� K��� ��h@�Y�;z�o���]~D��@�}��b�<�\�f���{TL�:�L�L�FV�i� �-M���V�W��W�sƸ��/>U��>�����N�PֽFzȐ����y��������O�XP�$�zi`Q�S񤍗����hՠ�����v�t��@�C��!䵁O'��H-B4 �r>LLv,`>c�R
 �`�s�>�g�ɉ��j�m�!(��j����+�/Ϯ�M�D�	�n]7>}k��:�Ў˘�&)�ZpAꋭ�n�F,¾�&�-,�I����&ڄ�7�&e�2ސj���/��A���|��]�����  d����q��	6`"�����?�P�r��6��a@�����m��>���o<S�:
)JLY`ȹ��_{޿��R�p�ߧ�%�܇߂�3D��a�A)ŐͰԢ���<Ր�`Ŋy�����N��o���L
KR9��9Qp���aiRo��8׻G&H�A&�!��X�����T@� D�vELș��/j8iSܴe��5*�}H�-$�q^� )���aq��Z		���\�,��%����;,��`��|����܎�mC��YQ�^Z�r�g#�>|{��<^�Χ��I M�z�~=��>�ޕ[I麰�Ƭ��B�E��R�r�ꟍ*��!M��,_s{�v䃕��[-q7��H0W�	����<>?@[�����=�5�I��vbf:d~��p޿��n5߽���L�Kr5�+8P��~���/���I!��Ͽ|���Р�r��Gj�������_n�}���n�w�_x�;@�{���'莠{��f�.�1w��ݏɖ2@pw�����݆/�XKh��tmĥ��N�?2�RKO���Ǽ�� �
��y��#��i��bKX����q0�����Ő��yH�p:�����#,���ߗG����5�h	����^��iѢ
U�3I:�Sn� N;\��!�`EX<�op���0�ܱ`p0��ò�����B�ϣ1�BH�	wrwx~;�G�(VV��,���ڛ/��J��=��s=��.���mTgbX��ZmÀS�%
��vϦ�/xL/��"�J���񃏻_a~�\�Pb4���5�_�a�w��YX7���\���7�}I�%��:1������yJ�>��e:Y�"��v~��g鄛u�����*V� 4P���r�V\�UX�3�5[^�����G��liK���,�x�7k�fiˮ��,����ik5���!�~5�Z�Z�}fA������R�VX�}f�}����p-ڢK���Y%�p0+�R	�il��S�s���͙}6�[�!����5W<�o�'�X+�M0�����nW~~�6���B��8���F�s�bѠL��:���=�:�Փg�Vb��ʵ�a�o����tS��OD?��dx�=�{�U6�L���2�
 !B4"�W��2b���b�D�؄���	�A���o��<y�5F ��V�$�J(��M���|�*,<Ҷ���V�G�8��wA�-���ZKf@Y�Ȣ�9��r�r�}���3��/8ے�R@��x��m ���0�8�x5e�����Z-�;<{����w"�f�����L�|/���l��>_F(l�wJtW�����0$-j|+�{�������'x�b�@T�Lb��>s�T�+!�=�?|}ߟh3�+���򑞭��zN�Gz��F�!�Ŋ[�g&!�'�D\�H�˾ ������j��yΧ�����K4����BG²o\پ ��0n�ӏ��=�<�_�0�[�T�;È��a����7�]Ko!t�O�]i�ĺ4���6e~?q�:�fd�n�0���/��?�'��RV��x�x|k����Zc=I�/L(
�(��E*A�Hx�9�����M���&Ai@���\�N}*m;յ]* 8$�e��g��8#[oP7z;�˯�T�ݎ�F��t�r^?ĉ^���(�|�T ��C����T(����S�Ե���K3�*;���8j�΂���9\����"t_���<K�jq��E�x�+6A�?���/�P��򛤄����ıA�w�-)[I����2())/RMR���v�9( lZ��J�r�~��F|8?��d)p�ڭ�O_�*�����?�A���!�J�懲ƕ��/B�&��+��������څ�7r�>�o���ҋpH�om���EMB��-B�Lyg�#
y���к�Т �Ev/�������r���P��� 1@����A��pC��u۽��ά��|q2�:��ж{��i���6�E�ز���{���ֶ���݋$l�7O�t/:�uR�0�i\�����1�t-��/�7C`f�A�m����7{v��\vo��FB����PS��.��jn��e�����w��jl+�:
c��)K¶{�1s�=�DyB��)�*�H��ò{h���-������ېE̾g/n��[�5	!){{��w���R���I�
���L�D���Y�H�Ec�<!��UE���+A�t�������&o쏡7�����bT �	�?O�ǿ�ח����r��(0t������i<.����'�ls�rG�D}9?>��%���7�x��ynh�g�H&��Dt�.� �KDS�v�DԂ�TCT�8�D������&:v<2����O�Ǝ��y24�Qa���xP�'3扸���������Y�ע3��y.o^'�K#��5�Fk��!��M�t�!`ђ���<u����9;����`�2�I�O�>�R�����ӫ��Ө净ηS[q������.b��ᢇnae�&�"��K5�\��xC芋Xq��p��ۗ7�Q)E?Ay�Ŋ�>=�����yUբD�r4u��=#L[tU�
~��ˎ����,?������%E���u�-ij�I�d�N�ى7Uۢh~P�6�g=�z�����У���Ɨ*�L>�;�h�����|w��u�'V�_B'^���P%N���Ss�[��� ��H�$�%u��Q�╙�������Gp���.���x���n�_�^���7,��6�?���c��Е/�/���/�'��|]C<\E*�Js��f%�CJiO�h�.���_�z��P�:�s���N�*?,&��빽���U�\��U�i�qƣR��I�v�}���;����ͬ��{��/MO�lg�\��f�ɷR�ZMy�z%�#J�S~��ًV�U���8VH��m�_e�i����	?=��ғ�|]�uI]Y�?=>����VKծ�+?�Ys0�Օ_r��5���L�20?��A+�Z����NG�������:W
y"�CR��`�ptoHI�!3�ސ�ZCn��{C~Hj�\�9��������E�k5M���Ҝ�k�W4��*��h�b�4ҩ�0���_��*��� E4��9_����v�q��黀/�'a(���/�W*�P$H�ꋟ�o�'������/�m��E*��	 u�xq����F����?��_�tT`˗9�c	�:��2b �S��j^�e�:@0xi6�A�����%r�>�����b��07w^��{�LUD���t�U�o��GG�mݐ�0������l��Y-�%���b����G��Y#��� +q+�a�����Dٯ�` \zQ�5��M�}
��u���w|�Wy,%�>��'<0�.�U+!�Ul��T�bKb�qWE�H��$��'����]��X)�O��� 8����i�vǂ�ϑA��ވ�H�f �&8n�䎯cO܂�5����5����3?��UT��V�����p�a-��W7̈́��Ȅ"������~���\��]F����|���0��랾�H7DG��a�lgj�n
���)����{K�}�e+���/�u��ⲫ=m�I_�"8�� �<J�~��gu�h-B�(n=    ���mP�g�Ü�b*�N��O�$�]P�I��q�M:�5J����/9�_�ʷ!4n#V>�`*4ӷ�6�7|�-�ϳ�QW�J�|L�Z�閗�1tj84X�4�� ���g��JYS"��9��)��@5U�����K,B�&1TeԡaH4n�H��V�bhu�C�0�N���p(�`$p�c�SG��`�\5)��Ʊf�p�F�"�Z��p0�O����3��%T�r:2%.(r:�^l���y\��9����$|�G�p]�SM�>��*��3ue�y!6����F&,K,J������Ƈ��F$x���:��\g���Bc�nd;qd���C��X0�W0�&�h�����I)@㍥�Ϊ����K�ՃA�;��G�Վ��e��p_�b��_i8o�Өw�l���1��X�r�L�Īl�ߍ�{GQcs��d�^��c�#p�;���ơȟ��e��ҩ���:�;VA ��[w��
�YF#����U����{���zs����P���Z�t���y�lX���J��n�&����^���5R�!�?/��_.�Ƽ�w�r|�$9=b�������CC��p�pمH(}S׷���L��[X3}�9`p���pZ%�	/�D&���5���A�xa��~�NO�(�����#/��A­��G�;/�Zj�`��ĩF�QyI(�%=�R��bH��N����i���%��6�8q�툋�9q�m�~txs>��{|C9��W6[�	>��U����rN�ga?��eP��(�m3�	�7��._݄C]db�`�ݐ?�>�l%�9�Ǝs;��E>�7�'�Qz/^]�T�X�D�Gy�o�c�(�wB���;�n�V=|�a��:�*>wڦ���F�LU����0�:����7hW�p�� ~u}����5U-���*��y�m�yؘ�B�m�z�~>���K;���� �����ѧ�#w���ׯ��b�M�K��n���b��K����|�!��<#�0�1��a�rz�=�K���̭V?���S8��_�i�*h��'�[���O.W��\-��k�$=~���ϭ6�\-�����o�#<^؀��5�C��U�)�h����᫁Ų
�b?7_\\]�X�B�m�vZ�/WV�/+4ӏ5�e�>u�+���֬ћU������.p��[�����`U`b?��U����k�k�yeU`%��]ŒA`��|�1�_��n����X��Kb��8m�G;�Cǆp-�ʭ|��
��~�������|�}z<����\�8|R��ǫ�Թ�&�|����,�@�.�X��Xԕ��d��ʷ�Ɏ!yg�5 /���뙦N}/])Ȅ!w����y�_�G��zo:�-?џ��7_nT�+�LF1����XՕ/���؆�m@�l���k���a5W��F=�rJ�#�J"W]�$-�aD6� b1gRy���������I�TL\�&����|�C<��I���uވ)�[�]��3c�W����}kY�f�n��a�Yn�lY�l�n�R*A���e/�W7���::y/x����iD�j�N��Q���29J�Wk��YM��XVX��Ɍ��6��Dj\5H��K�D��F������PX��I^@Dy$��+Ca���-��Z�2� 2�1��3
Sf5+�^�2�a=rwpe$������PX��.�\��V��^ZT�\�,y.x.&��j���ȹF\5ĕ+�k��	��Y���pX�����!�e�Y�H�U�C�x�WF��ln_iRO��4&QH.��~aTA<�8�b� �r�6�_w�X㶄�jcTF��T����ɨ�C�+o:FMm>�����g|Tu��1u��/��� �y�FO���3�3u�Ăv�iZ��T-S���Q�wW��Us��u�^�v��Qȟ�(� � ��#�ۡG�qS����HC�;�aA�=����4�#��6V�V��R�H޾͙s>�wV�����tFnw����\�ә� �W ��K��)�k��K�u�[\r���)aH^�M����X[I!sS�-򱣸ػy@_��p	rj@]􈩺��5/̈���c�숻t��<n�m�x���F}<�>��'9��	]6�����zRI�' 꾁v�:�&`=k�]�',�1f|���	>J$Aՙ��n��~?�X�)�t���4��&����_�]�r�ڵ�x\���ʠ+'%V� /��`��ˮ�u�M�MW0X��O�i[B,T�'�T]�R���!|EM����e>8�*���k�K��P�E��X�Xޯ��JD��V���5U|�8���7��m��.����E+�oea�IWg�2��>08�L��~�]�<���<5 ��f�'r��~��)�V;BkBc��?����'1%5��K�>�����A/8�[�6121~:=����iDz}ѧ��G|B�2Q#Ѯ�)��t��q����IS���m;�1�K�ta{��1�#3�0�D?�H�e��^��S�9/�w+L��ȶ�Ȭ��m����4+L�&Z�^:ɿ���\����Å���O]g�� 7�(0q8i�rvQM+D9��9��S��V?�Z����E���'�2��
f� �(~UE�c����_���h���z�QWh��j�����%je�3_�(�k�t��P�U-�W����uӁV��X'~h��Ǻ����ў��g.�tRh�j��\�j�\��"5��7C`.�1[oF�\��3ΌX:�z3`�o�?`�o�yit��u��xd��B��u�iܲ�Ƹ4Ҫ\Z�� ����J�����V۟�����C?j���߽?��4R�\�I�>��_���TX���J��
���y՘(/�������J��f�X�k���JV�21.f�x[S�>"ʼ������31.�۶�Qu�d�X�k*�GL�L2Q-�[f����2+f�Yvd�v��k�bOL��a��g��K� +f�rT>��	�� 7�00aN�&+f�Z!���L=�O���f�*�b�� �PV�
n�������S�\V�
]V��x�-�t���?_Ӳ�Q]PZ&d�����k̵F:�x�GY1�wɰ�?�aV�
ƺˊ�}�e���š^�����d�K#�eŬ0�AV���<5���f�L�0�mV����rƙi<������e�ğ�<ʊ�it���5��B��u�gŬqi�Y1�\Z�Y1+�{=+f������C?j���/�b�Q��� +f��DXˊYg<V�bVdT}V�D3&�ċx8��Z9Jgh/)n�F�=?���%���I0ަ���	�y�;i�,J�|�m�T�ѣm�j��S����� �$�S������5Q���Ռ8�v�|�������)l׳o�dK��cѴCjX�67��m���2�(��#r�un�6�U%���_�<Lj[�(}ӆ�f�*[f���_�w)s�n�X�����5f�,QCO�g�R�q�Y4�k�un�8�yh��X"��Vqw�菹��7@@z{(�[��mK*����m�<e`pWå3>�B����',�Y�C���A��1�5&g
#0�E��V]�9�Ky���li�  �u4�\��a��jw�b8Ud�O �"ȸ�`pO!�� Ӳ��
N�@����Adn,t�� �v���m� ���2��[N-�̠�`FFu�;@1��.�)ʸ'��#z|��5��2X�� 
�|㣤���I�9)�匛� ���E�IYlÔfH+O�)��+�+�0�Mp͗�U�����7[�n��hh�0����?N�s�<Sb�Qzx(��@ݥ��͈�)��|:�w67Vɋ���2#�=�6�#J�jW~�2Lx����j_�Qb-z�1���K	?t��&79S^Z��R�7�\��91l<m�7�~@�k�-�^�X��tfI�#���QZ�\:�$�37�-�(�.LЗ�.�u�	�$ثF����m���_�D��%�<������4���sU��ingu]�k��~�nj�W ��J��<��5�q��z�ܕ��X��n�!SIH�˝�}~���v�g���/�tP�<�	��Ie��LM �  ��x�1�̰��Z�N #�^�Cۡ2tk;
d����0���2�񲭮��늈�VWDʍu1b�-"�ڦ�S�F$�-֏�jͰ����qj��F�GF���*���l��5e�X&Z�)���o�U��6=st���n[��_*�M`̶�����1G��T�5���6��:u�9Hʧ����-֩C�F/F��T�s�����*k�?���[8�ҡ~�p�����{��!�R�ba�01�9�r�`�<a����?j�;4�RG�>�(hQ�t۴�5�4A[MC8��<`5���Fs	o��D0��tG�]�0�����p*����V��hQ�+��J$WH�31�`d��Z�r^�bY���M�$�������˷��	��"�� �i�.L <�m��[���0�ʖnۖ\kb1��X�-XM;���@��bG��HF�*�N���抗 `ի���OtН�!	���E �2��E k/��s `X��J����9�X$����-�VK��Ͳ�ۦ%,�������-�N�l�Y��E���E.�p�1X���r��W\�1v&�zL���N�,��xG��mq�p��G���R�Tx&�&9���c�Z6�L5�q>����u��ص���t�ZӨ`V�l�]4J�l�"��KS��Rr�|����A���OO�`�������BEBrO5�P���7�N;�1���K��=p$�<�$�<E���#!v��d`q�}�V�w`5�}�I��@a�h�`���qss�� �5�     