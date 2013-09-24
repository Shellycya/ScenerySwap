var artist1 = "";
var artist2 = "";
var artist3 = "";
var artist4 = "";

var modelPic11 = "";
var modelPic12 = "";
var modelPic13 = "";
var modelPic21 = "";
var modelPic22 = "";
var modelPic23 = "";
var modelPic31 = "";
var modelPic32 = "";
var modelPic33 = "";
var modelPic41 = "";
var modelPic42 = "";
var modelPic43 = "";

var modelName11 = "";
var modelName12 = "";
var modelName13 = "";
var modelName21 = "";
var modelName22 = "";
var modelName23 = "";
var modelName31 = "";
var modelName32 = "";
var modelName33 = "";
var modelName41 = "";
var modelName42 = "";
var modelName43 = "";

var section11 = "";
var section12 = "";
var section13 = "";
var section21 = "";
var section22 = "";
var section23 = "";
var section31 = "";
var section32 = "";
var section33 = "";
var section41 = "";
var section42 = "";
var section43 = "";

function hover11() {
    getPresetInfo(1);
    setInfo(modelPic11, artist1, modelName11, section11);
}
function hover12() {
    getPresetInfo(1);
    setInfo(modelPic12, artist1, modelName12, section12);
}
function hover13() {
    getPresetInfo(1);
    setInfo(modelPic13, artist1, modelName13, section13);
}

function hover21() {
    getPresetInfo(2);
    setInfo(modelPic21, artist2, modelName21, section21);
}
function hover22() {
    getPresetInfo(2);
    setInfo(modelPic22, artist2, modelName22, section22);
}

function hover23() {
    getPresetInfo(2);
    setInfo(modelPic23, artist2, modelName23, section23);
}


function hover31() {
    getPresetInfo(3);
    setInfo(modelPic31, artist3, modelName31, section31);
}
function hover32() {
    getPresetInfo(3);
    setInfo(modelPic32, artist3, modelName32, section32);
}
function hover33() {
    getPresetInfo(3);
    setInfo(modelPic33, artist3, modelName33, section33);
}

function hover41() {
    getPresetInfo(4);
    setInfo(modelPic41, artist4, modelName41, section41);
}
function hover42() {
    getPresetInfo(4);
    setInfo(modelPic42, artist4, modelName42, section42);
}
function hover43() {
    getPresetInfo(4);
    setInfo(modelPic43, artist4, modelName43, section43);
}

function getPresetInfo(artistNum) {
   switch (artistNum)
   {
       case 1:
           artist1 = document.getElementById("ContentPlaceHolder1_FeatArtistLBL1").innerHTML;
           modelName11 = document.getElementById("ContentPlaceHolder1_HiddenModel11").innerHTML;
           modelName12 = document.getElementById("ContentPlaceHolder1_HiddenModel12").innerHTML;
           modelName13 = document.getElementById("ContentPlaceHolder1_HiddenModel13").innerHTML;
           modelPic11 = document.getElementById("ContentPlaceHolder1_HiddenURL11").innerHTML;
           modelPic12 = document.getElementById("ContentPlaceHolder1_HiddenURL12").innerHTML;
           modelPic13 = document.getElementById("ContentPlaceHolder1_HiddenURL13").innerHTML;
           section11 = document.getElementById("ContentPlaceHolder1_HiddenGenre11").innerHTML;
           section12 = document.getElementById("ContentPlaceHolder1_HiddenGenre12").innerHTML;
           section13 = document.getElementById("ContentPlaceHolder1_HiddenGenre13").innerHTML;
           break;
       case 2:
           artist2 = document.getElementById("ContentPlaceHolder1_FeatArtistLBL2").innerHTML;
           modelName21 = document.getElementById("ContentPlaceHolder1_HiddenModel21").innerHTML;
           modelName22 = document.getElementById("ContentPlaceHolder1_HiddenModel22").innerHTML;
           modelName23 = document.getElementById("ContentPlaceHolder1_HiddenModel23").innerHTML;
           modelPic21 = document.getElementById("ContentPlaceHolder1_HiddenURL21").innerHTML;
           modelPic22 = document.getElementById("ContentPlaceHolder1_HiddenURL22").innerHTML;
           modelPic23 = document.getElementById("ContentPlaceHolder1_HiddenURL23").innerHTML;
           section21 = document.getElementById("ContentPlaceHolder1_HiddenGenre21").innerHTML;
           section22 = document.getElementById("ContentPlaceHolder1_HiddenGenre22").innerHTML;
           section23 = document.getElementById("ContentPlaceHolder1_HiddenGenre23").innerHTML;
           break;
       case 3:
           artist3 = document.getElementById("ContentPlaceHolder1_FeatArtistLBL3").innerHTML;
           modelName31 = document.getElementById("ContentPlaceHolder1_HiddenModel31").innerHTML;
           modelName32 = document.getElementById("ContentPlaceHolder1_HiddenModel32").innerHTML;
           modelName33 = document.getElementById("ContentPlaceHolder1_HiddenModel33").innerHTML;
           modelPic31 = document.getElementById("ContentPlaceHolder1_HiddenURL31").innerHTML;
           modelPic32 = document.getElementById("ContentPlaceHolder1_HiddenURL32").innerHTML;
           modelPic33 = document.getElementById("ContentPlaceHolder1_HiddenURL33").innerHTML;
           section31 = document.getElementById("ContentPlaceHolder1_HiddenGenre31").innerHTML;
           section32 = document.getElementById("ContentPlaceHolder1_HiddenGenre32").innerHTML;
           section33 = document.getElementById("ContentPlaceHolder1_HiddenGenre33").innerHTML;
           break;
        case 4:
           artist4 = document.getElementById("ContentPlaceHolder1_FeatArtistLBL4").innerHTML;
           modelName41 = document.getElementById("ContentPlaceHolder1_HiddenModel41").innerHTML;
           modelName42 = document.getElementById("ContentPlaceHolder1_HiddenModel42").innerHTML;
           modelName43 = document.getElementById("ContentPlaceHolder1_HiddenModel43").innerHTML;
           modelPic41 = document.getElementById("ContentPlaceHolder1_HiddenURL41").innerHTML;
           modelPic42 = document.getElementById("ContentPlaceHolder1_HiddenURL42").innerHTML;
           modelPic43 = document.getElementById("ContentPlaceHolder1_HiddenURL43").innerHTML;
           section41 = document.getElementById("ContentPlaceHolder1_HiddenGenre41").innerHTML;
           section42 = document.getElementById("ContentPlaceHolder1_HiddenGenre42").innerHTML;
           section43 = document.getElementById("ContentPlaceHolder1_HiddenGenre43").innerHTML;
           break;
       default:
           break;
   }
}

function setInfo(modelPic, artist, modelName, section) {
    if (document.images) document.FeaturedIMG.src = modelPic;
    var artistLabel = document.getElementById("ContentPlaceHolder1_featuredArtistLink");
    var artistLabel2 = document.getElementById("ContentPlaceHolder1_FloatArtist");
    var modelLabel = document.getElementById("ContentPlaceHolder1_featuredModelLink");
    var modelLabel2 = document.getElementById("ContentPlaceHolder1_FloatModel");
    var sectionName = document.getElementById("ContentPlaceHolder1_FloatSection");
    document.getElementById('HiddenArtist').value = artist;
    document.getElementById('HiddenModel').value = modelName;
    document.getElementById('HiddenGenre').value = section;
    artistLabel.innerHTML = artist;
    artistLabel2.innerHTML = artist;
    modelLabel.innerHTML = modelName;
    modelLabel2.innerHTML = modelName;
    sectionName.innerHTML = section;
}




