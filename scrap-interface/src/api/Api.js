var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Cookie", "");

var raw = {
  "url": "http//www.helllooodlkfnladnfkladjbf.com"
};

var requestOptions = {
  method: 'POST',
  mode: 'cors',
  headers: myHeaders,
  body: raw,
};

export default requestOptions