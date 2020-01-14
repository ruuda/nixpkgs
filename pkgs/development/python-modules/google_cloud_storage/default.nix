{ stdenv
, buildPythonPackage
, fetchPypi
, google_resumable_media
, google_api_core
, google_cloud_core
, pytest
, mock
, setuptools
}:

buildPythonPackage rec {
  pname = "google-cloud-storage";
  version = "1.24.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1w8mf0rhs2lsa6bf4dqqqdyqfla4fwxpsd31vszqgfcrh2x7gzms";
  };

  propagatedBuildInputs = [
    google_resumable_media
    google_api_core
    google_cloud_core
    setuptools
  ];
  checkInputs = [ pytest mock ];

  checkPhase = ''
   pytest tests/unit
  '';

  meta = with stdenv.lib; {
    description = "Google Cloud Storage API client library";
    homepage = https://github.com/GoogleCloudPlatform/google-cloud-python;
    license = licenses.asl20;
    maintainers = [ maintainers.costrouc ];
  };
}
