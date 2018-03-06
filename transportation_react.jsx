function TransportTitle(props){
  return (
    <div>
      <h2>{props.title}</h2>
      <p>The best place to buy vehicles online</p>
    </div>
  ) 
}
function SelectType(props){
  var cartypes = [];
  for (var i = 0; i < props.cartypes.length; i++){
    cartypes.push(<option value={props.cartypes[i]}>{props.cartypes[i]}</option>)
  }
  return (
    <div>
      <label>Select Type</label>
      <select>{cartypes}</select>
    </div>
  )
}
function ChooseOption(props){
  return (
    <div>
      <div>
        <h2>{props.title}</h2>
      </div>
      <div>
        <label for="new">New Only</label> 
        <input type="checkbox" id="new" name="new" />
      </div>
      <div>
        <SelectType cartypes={props.cartypes} />
      </div>
    </div>
  );
}
function ListItem(props){
  return (
    <blockquote>
      <table>
        <tr> 
          <th>Year</th>
          <th>Model</th>
          <th>Price</th>
          <th>Buy</th>
        </tr>
        <tr>
          <td>{props.item[0]}</td>
          <td>{props.item[1]}</td>
          <td>{props.item[2]}</td>
          <td><button type="button">Buy Now</button></td>
        </tr>
      </table>
    </blockquote>
  );
}
function ListItems(props){
  return props.items.map((i) => (
   <ListItem item = {i}/>));
 }
function CarList(props){
  return (
    <div>
      <h2>{props.header}</h2>
      <ListItems items = {props.items} />
    </div>
  )
}
function TransportationApp(props){
  return (
    <div>
      <TransportTitle title = "Welcome to React Transportation" />
      <ChooseOption title = "Choose Options" cartypes = {["All", "Cars", "Trucks", "Convertibles"]}/>
      <CarList header = "Cars" items = {[["2013", "A", "$32000"], ["2011", "B", "$4400"], ["2016", "B", "$15500"]]}/>
      <CarList header = "Trucks" items = {[["2014", "D", "$18000"], ["2013", "E", "$5200"]]}/>
      <CarList header = "Convertibles" items = {[["2009", "F", "$2000"], ["2010", "G", "$6000"], ["2012", "H", "$12500"], ["2017", "M", "$50000"]]}/>
    </div>
  )
}
ReactDOM.render(
  <TransportationApp/>,
  document.getElementById("root")
)
