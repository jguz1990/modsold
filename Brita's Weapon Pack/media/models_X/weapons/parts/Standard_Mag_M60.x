xof 0303txt 0032

template Frame {
  <3d82ab46-62da-11cf-ab39-0020af71e433>
  [...]
}

template Matrix4x4 {
  <f6f23f45-7686-11cf-8f52-0040333594a3>
  array FLOAT matrix[16];
}

template FrameTransformMatrix {
  <f6f23f41-7686-11cf-8f52-0040333594a3>
  Matrix4x4 frameMatrix;
}

template Vector {
  <3d82ab5e-62da-11cf-ab39-0020af71e433>
  FLOAT x;
  FLOAT y;
  FLOAT z;
}

template MeshFace {
  <3d82ab5f-62da-11cf-ab39-0020af71e433>
  DWORD nFaceVertexIndices;
  array DWORD faceVertexIndices[nFaceVertexIndices];
}

template Mesh {
  <3d82ab44-62da-11cf-ab39-0020af71e433>
  DWORD nVertices;
  array Vector vertices[nVertices];
  DWORD nFaces;
  array MeshFace faces[nFaces];
  [...]
}

template MeshNormals {
  <f6f23f43-7686-11cf-8f52-0040333594a3>
  DWORD nNormals;
  array Vector normals[nNormals];
  DWORD nFaceNormals;
  array MeshFace faceNormals[nFaceNormals];
}

template Coords2d {
  <f6f23f44-7686-11cf-8f52-0040333594a3>
  FLOAT u;
  FLOAT v;
}

template MeshTextureCoords {
  <f6f23f40-7686-11cf-8f52-0040333594a3>
  DWORD nTextureCoords;
  array Coords2d textureCoords[nTextureCoords];
}

template ColorRGBA {
  <35ff44e0-6c7c-11cf-8f52-0040333594a3>
  FLOAT red;
  FLOAT green;
  FLOAT blue;
  FLOAT alpha;
}

template IndexedColor {
  <1630b820-7842-11cf-8f52-0040333594a3>
  DWORD index;
  ColorRGBA indexColor;
}

template MeshVertexColors {
  <1630b821-7842-11cf-8f52-0040333594a3>
  DWORD nVertexColors;
  array IndexedColor vertexColors[nVertexColors];
}

template VertexElement {
  <f752461c-1e23-48f6-b9f8-8350850f336f>
  DWORD Type;
  DWORD Method;
  DWORD Usage;
  DWORD UsageIndex;
}

template DeclData {
  <bf22e553-292c-4781-9fea-62bd554bdd93>
  DWORD nElements;
  array VertexElement Elements[nElements];
  DWORD nDWords;
  array DWORD data[nDWords];
}

Frame DXCC_ROOT {
  FrameTransformMatrix {
     1.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000,
    0.0000000000000000, 1.0000000000000000, 0.0000000000000000, 0.0000000000000000,
    0.0000000000000000, 0.0000000000000000, 1.0000000000000000, 0.0000000000000000,
    0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 1.0000000000000000;;
  }

  Frame izqtn5h71f91_obj {
    FrameTransformMatrix {
       1.0000000000000000, 0.0000000000000000, -0.0000000000000000, 0.0000000000000000,
      0.0000000000000000, 1.0000000000000000, -0.0000000000000000, 0.0000000000000000,
      -0.0000000000000000, -0.0000000000000000, 1.0000000000000000, -0.0000000000000000,
      0.0000000000000000, 0.0000000000000000, -0.0000000000000000, 1.0000000000000000;;
    }

    Frame Box007_Mesh {
      FrameTransformMatrix {
         1.0000000000000000, 0.0000000000000000, -0.0000000000000000, 0.0000000000000000,
        0.0000000000000000, 1.0000000000000000, -0.0000000000000000, 0.0000000000000000,
        -0.0000000000000000, -0.0000000000000000, 1.0000000000000000, -0.0000000000000000,
        0.0000000000000000, 0.0000000000000000, -0.0000000000000000, 1.0000000000000000;;
      }

      Mesh Box007_Mesh_mShape {
        72;
        0.0166790001094341;0.0153930000960827;-0.0401990003883839;,
        0.0732289999723434;0.0153930000960827;-0.0401990003883839;,
        0.0732289999723434;0.0703419968485832;-0.0401990003883839;,
        0.0732289999723434;0.0703419968485832;-0.0401990003883839;,
        0.0166790001094341;0.0703419968485832;-0.0401990003883839;,
        0.0166790001094341;0.0153930000960827;-0.0401990003883839;,
        0.0166790001094341;0.0153930000960827;0.0292460005730391;,
        0.0166790001094341;0.0703419968485832;0.0292460005730391;,
        0.0732289999723434;0.0703419968485832;0.0292460005730391;,
        0.0732289999723434;0.0703419968485832;0.0292460005730391;,
        0.0732289999723434;0.0153930000960827;0.0292460005730391;,
        0.0166790001094341;0.0153930000960827;0.0292460005730391;,
        0.0166790001094341;0.0153930000960827;-0.0401990003883839;,
        0.0166790001094341;0.0703419968485832;-0.0401990003883839;,
        0.0166790001094341;0.0703419968485832;0.0292460005730391;,
        0.0166790001094341;0.0703419968485832;0.0292460005730391;,
        0.0166790001094341;0.0153930000960827;0.0292460005730391;,
        0.0166790001094341;0.0153930000960827;-0.0401990003883839;,
        0.0166790001094341;0.0703419968485832;-0.0401990003883839;,
        0.0732289999723434;0.0703419968485832;-0.0401990003883839;,
        0.0732289999723434;0.0703419968485832;0.0292460005730391;,
        0.0732289999723434;0.0703419968485832;0.0292460005730391;,
        0.0166790001094341;0.0703419968485832;0.0292460005730391;,
        0.0166790001094341;0.0703419968485832;-0.0401990003883839;,
        0.0732289999723434;0.0703419968485832;-0.0401990003883839;,
        0.0732289999723434;0.0153930000960827;-0.0401990003883839;,
        0.0732289999723434;0.0153930000960827;0.0292460005730391;,
        0.0732289999723434;0.0153930000960827;0.0292460005730391;,
        0.0732289999723434;0.0703419968485832;0.0292460005730391;,
        0.0732289999723434;0.0703419968485832;-0.0401990003883839;,
        0.0732289999723434;0.0153930000960827;-0.0401990003883839;,
        0.0166790001094341;0.0153930000960827;-0.0401990003883839;,
        0.0166790001094341;0.0153930000960827;0.0292460005730391;,
        0.0166790001094341;0.0153930000960827;0.0292460005730391;,
        0.0732289999723434;0.0153930000960827;0.0292460005730391;,
        0.0732289999723434;0.0153930000960827;-0.0401990003883839;,
        0.0150340003892779;0.0213109999895096;0.0317079983651638;,
        0.0191290006041527;0.0213109999895096;0.0283569991588593;,
        0.0191290006041527;0.0644240006804466;0.0283569991588593;,
        0.0191290006041527;0.0644240006804466;0.0283569991588593;,
        0.0150340003892779;0.0644240006804466;0.0317079983651638;,
        0.0150340003892779;0.0213109999895096;0.0317079983651638;,
        0.0150340003892779;0.0213109999895096;0.0375379994511604;,
        0.0150340003892779;0.0644240006804466;0.0375379994511604;,
        0.0270610004663467;0.0644240006804466;0.0282940007746220;,
        0.0270610004663467;0.0644240006804466;0.0282940007746220;,
        0.0270610004663467;0.0213109999895096;0.0282940007746220;,
        0.0150340003892779;0.0213109999895096;0.0375379994511604;,
        0.0150340003892779;0.0213109999895096;0.0317079983651638;,
        0.0150340003892779;0.0644240006804466;0.0317079983651638;,
        0.0150340003892779;0.0644240006804466;0.0375379994511604;,
        0.0150340003892779;0.0644240006804466;0.0375379994511604;,
        0.0150340003892779;0.0213109999895096;0.0375379994511604;,
        0.0150340003892779;0.0213109999895096;0.0317079983651638;,
        0.0150340003892779;0.0644240006804466;0.0317079983651638;,
        0.0191290006041527;0.0644240006804466;0.0283569991588593;,
        0.0270610004663467;0.0644240006804466;0.0282940007746220;,
        0.0270610004663467;0.0644240006804466;0.0282940007746220;,
        0.0150340003892779;0.0644240006804466;0.0375379994511604;,
        0.0150340003892779;0.0644240006804466;0.0317079983651638;,
        0.0191290006041527;0.0644240006804466;0.0283569991588593;,
        0.0191290006041527;0.0213109999895096;0.0283569991588593;,
        0.0270610004663467;0.0213109999895096;0.0282940007746220;,
        0.0270610004663467;0.0213109999895096;0.0282940007746220;,
        0.0270610004663467;0.0644240006804466;0.0282940007746220;,
        0.0191290006041527;0.0644240006804466;0.0283569991588593;,
        0.0191290006041527;0.0213109999895096;0.0283569991588593;,
        0.0150340003892779;0.0213109999895096;0.0317079983651638;,
        0.0150340003892779;0.0213109999895096;0.0375379994511604;,
        0.0150340003892779;0.0213109999895096;0.0375379994511604;,
        0.0270610004663467;0.0213109999895096;0.0282940007746220;,
        0.0191290006041527;0.0213109999895096;0.0283569991588593;;
        24;
        3;2,1,0;,
        3;5,4,3;,
        3;8,7,6;,
        3;11,10,9;,
        3;14,13,12;,
        3;17,16,15;,
        3;20,19,18;,
        3;23,22,21;,
        3;26,25,24;,
        3;29,28,27;,
        3;32,31,30;,
        3;35,34,33;,
        3;38,37,36;,
        3;41,40,39;,
        3;44,43,42;,
        3;47,46,45;,
        3;50,49,48;,
        3;53,52,51;,
        3;56,55,54;,
        3;59,58,57;,
        3;62,61,60;,
        3;65,64,63;,
        3;68,67,66;,
        3;71,70,69;;

        MeshMaterialList {
          1;
          24;
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
          Material {
            1.0; 1.0; 1.0; 1.000000;;
            1.000000;
            0.000000; 0.000000; 0.000000;;
            0.000000; 0.000000; 0.000000;;
            TextureFilename { ""; }
          }
        }

        MeshNormals {
        72;
        -0.0000000000000000;0.0000000000000000;1.0000000000000000;,
        -0.0000000000000000;0.0000000000000000;1.0000000000000000;,
        -0.0000000000000000;0.0000000000000000;1.0000000000000000;,
        -0.0000000000000000;0.0000000000000000;1.0000000000000000;,
        -0.0000000000000000;0.0000000000000000;1.0000000000000000;,
        -0.0000000000000000;0.0000000000000000;1.0000000000000000;,
        -0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        -0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        -0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        -0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        -0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        -0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -1.0000000000000000;0.0000000000000000;0.0000000000000000;,
        -1.0000000000000000;0.0000000000000000;0.0000000000000000;,
        -1.0000000000000000;0.0000000000000000;0.0000000000000000;,
        -1.0000000000000000;0.0000000000000000;0.0000000000000000;,
        -1.0000000000000000;0.0000000000000000;0.0000000000000000;,
        -1.0000000000000000;0.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        0.6333000063896179;0.0000000000000000;0.7738999724388123;,
        0.6333000063896179;0.0000000000000000;0.7738999724388123;,
        0.6333000063896179;0.0000000000000000;0.7738999724388123;,
        0.6333000063896179;0.0000000000000000;0.7738999724388123;,
        0.6333000063896179;0.0000000000000000;0.7738999724388123;,
        0.6333000063896179;0.0000000000000000;0.7738999724388123;,
        -0.6093999743461609;-0.0000000000000000;-0.7929000258445740;,
        -0.6093999743461609;-0.0000000000000000;-0.7929000258445740;,
        -0.6093999743461609;-0.0000000000000000;-0.7929000258445740;,
        -0.6093999743461609;-0.0000000000000000;-0.7929000258445740;,
        -0.6093999743461609;-0.0000000000000000;-0.7929000258445740;,
        -0.6093999743461609;-0.0000000000000000;-0.7929000258445740;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        -0.0000000000000000;-1.0000000000000000;0.0000000000000000;,
        0.0078999996185303;0.0000000000000000;1.0000000000000000;,
        0.0076000001281500;0.0000000000000000;1.0000000000000000;,
        0.0078999996185303;0.0000000000000000;1.0000000000000000;,
        0.0078999996185303;0.0000000000000000;1.0000000000000000;,
        0.0078999996185303;0.0000000000000000;1.0000000000000000;,
        0.0078999996185303;0.0000000000000000;1.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;,
        -0.0000000000000000;1.0000000000000000;-0.0000000000000000;;
        24;
        3;2,1,0;,
        3;5,4,3;,
        3;8,7,6;,
        3;11,10,9;,
        3;14,13,12;,
        3;17,16,15;,
        3;20,19,18;,
        3;23,22,21;,
        3;26,25,24;,
        3;29,28,27;,
        3;32,31,30;,
        3;35,34,33;,
        3;38,37,36;,
        3;41,40,39;,
        3;44,43,42;,
        3;47,46,45;,
        3;50,49,48;,
        3;53,52,51;,
        3;56,55,54;,
        3;59,58,57;,
        3;62,61,60;,
        3;65,64,63;,
        3;68,67,66;,
        3;71,70,69;;
        }

        MeshTextureCoords {
        72;
        0.4885630011558533;0.4837679862976074;,
        0.4885630011558533;0.7051979899406433;,
        0.5864199995994568;0.7052639722824097;,
        0.5864199995994568;0.7052639722824097;,
        0.5864199995994568;0.4838349819183350;,
        0.4885630011558533;0.4837679862976074;,
        0.0993499979376793;0.4348539710044861;,
        0.0014680000022054;0.4348949790000916;,
        0.0014680000022054;0.6563340425491333;,
        0.0014680000022054;0.6563340425491333;,
        0.0993499979376793;0.6562919616699219;,
        0.0993499979376793;0.4348539710044861;,
        0.4887320101261139;0.8395810127258301;,
        0.5866339802742004;0.8395850062370300;,
        0.5866339802742004;0.7166759967803955;,
        0.5866339802742004;0.7166759967803955;,
        0.4887320101261139;0.7166709899902344;,
        0.4887320101261139;0.8395810127258301;,
        0.2464690059423447;0.6860089898109436;,
        0.2464690059423447;0.4645259976387024;,
        0.1227549985051155;0.4645329713821411;,
        0.1227549985051155;0.4645329713821411;,
        0.1227549985051155;0.6860150098800659;,
        0.2464690059423447;0.6860089898109436;,
        0.2542519867420197;0.4593530297279358;,
        0.3521549999713898;0.4593639969825745;,
        0.3521549999713898;0.3366879820823669;,
        0.3521549999713898;0.3366879820823669;,
        0.2542519867420197;0.3366780281066895;,
        0.2542519867420197;0.4593530297279358;,
        0.2510170042514801;0.4645760059356689;,
        0.2510170042514801;0.6860600113868713;,
        0.3747430145740509;0.6860600113868713;,
        0.3747430145740509;0.6860600113868713;,
        0.3747430145740509;0.4645760059356689;,
        0.2510170042514801;0.4645760059356689;,
        0.8413159847259521;0.1510859727859497;,
        0.8575879931449890;0.1512569785118103;,
        0.8575879931449890;0.0749740004539490;,
        0.8575879931449890;0.0749740004539490;,
        0.8413159847259521;0.0748029947280884;,
        0.8413159847259521;0.1510859727859497;,
        0.0484500005841255;0.1503630280494690;,
        0.0484500005841255;0.0740609765052795;,
        0.0007159999804571;0.0743849873542786;,
        0.0007159999804571;0.0743849873542786;,
        0.0007159999804571;0.1506879925727844;,
        0.0484500005841255;0.1503630280494690;,
        0.3518910109996796;0.3336930274963379;,
        0.3518910109996796;0.2573739886283875;,
        0.3415069878101349;0.2573739886283875;,
        0.3415069878101349;0.2573739886283875;,
        0.3415069878101349;0.3336930274963379;,
        0.3518910109996796;0.3336930274963379;,
        0.5211489796638489;0.0559859871864319;,
        0.5208050012588501;0.0730829834938049;,
        0.5309590101242065;0.1024659872055054;,
        0.5309590101242065;0.1024659872055054;,
        0.5309590101242065;0.0526000261306763;,
        0.5211489796638489;0.0559859871864319;,
        0.8575879931449890;0.0749740004539490;,
        0.8575879931449890;0.1512569785118103;,
        0.8888509869575500;0.1512389779090881;,
        0.8888509869575500;0.1512389779090881;,
        0.8888509869575500;0.0749559998512268;,
        0.8575879931449890;0.0749740004539490;,
        0.1096709966659546;0.3006820082664490;,
        0.1100149974226952;0.3177800178527832;,
        0.1198259964585304;0.3211650252342224;,
        0.1198259964585304;0.3211650252342224;,
        0.1198259964585304;0.2713000178337097;,
        0.1096709966659546;0.3006820082664490;;
        }
      }

    }

  }

}
