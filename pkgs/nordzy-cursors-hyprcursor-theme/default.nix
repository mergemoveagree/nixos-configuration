{ stdenvNoCC
, fetchFromGitHub
, lib
}:
stdenvNoCC.mkDerivation {
  pname = "nordzy-cursors-hyprcursor-theme";
  version = "2.3.0";
  src = fetchFromGitHub {
    owner = "guillaumeboehm";
    repo = "Nordzy-cursors";
    rev = "v2.3.0";
    hash = "sha256-3HUSl0CQcay4V9pO35cmOEZvrgNOJ3WNZahs+hJjUJU=";
  };
  installPhase = ''
    mkdir -p $out/share/icons
    for theme in hyprcursors/themes/*
    do
      cp -r ''$theme $out/share/icons
    done
  '';

  meta = with lib; {
    description = "Cursor theme using the Nord color palette and based on Vimix and cz-Viator";
    homepage = "https://github.com/guillaumeboehm/Nordzy-cursors";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
