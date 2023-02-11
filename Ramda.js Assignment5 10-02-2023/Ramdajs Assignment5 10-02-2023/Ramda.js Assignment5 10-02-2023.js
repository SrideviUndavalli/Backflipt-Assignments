


//1) sort (desc) array of objects based startDate key ex-obj {task:'TASK_NAME',startDate:'22-3-2021',endDate:'25-4-2021'}

var clerk = {name: 'sridevi',startdate: '25-02-2002',salary:200000};
var  employee= {name: 'manoj',startdate: '25-01-2002',salary:250000};
var hr = {name: 'clara',startdate: '26-02-2002',salary:534000};
var company=[clerk,employee,hr];
// covert date to YYYY-MM-DD format for sorting w.r.t startdate
const dateConvert = y => {
 var x=y.startdate;
  x= x.split("-");
  if(x[0].length < 2) x[0]="0"+x[0];
  if(x[1].length <2) x[1]="0"+x[1];
  y.startDate=R.join("-",R.reverse(x))            
}


//to sort dates
R.map(dateConvert, company);
const ageNameSort = R.sortWith([R.descend(R.prop('startDate'))]);
var company = ageNameSort(company);


//resetting dates to initial form
const rev = x => {
  var y=x.startDate
  y=y.split("-")
  y[1]=parseInt(y[1])
  y[2]=parseInt(y[2])
  x.startDate=R.join("-",R.reverse(y))
  return x 
}
company=R.map(rev,company)
console.clear()
for ( var i in company ) console.log(company[i]);
company;


//2) lets say you have objects with keys {name:"",address:"",phone:"" .........} remove these three fileds from the given object

const person={
    name:'devi',age:24,phone:8919897654,address:"devarapalli",gender:'female',pin:534315}
  
  delete person['name'];
  delete person['phone'];
  delete person['address'];
  console.log(person);

//3) concat two array of objects and sort (asc) it based on "cost" key

const vehicle1={ownername:'sanjeev',type:'car',age:32,cost:240000};
const vehicle2={ownername:'viraj',type:'bike',age:34,cost:24000};
const vechicle3={ownername:'sanvi',type:'scooty',age:21,cost:30000};
const vechicle4={ownername:'Manoj',type:'royalenfeild',age:32,cost:250000};
var house=[
  {task:' maintainance',cost:5000}
  ,{task:'cleaning',
   cost:8000},
   {task:'food',cost:7000}
];
const sortbycost = R.sortBy(R.compose(R.prop('cost')));
 var vehicles=[vehicle1,vehicle2,vechicle3,vechicle4];
var concatobj=R.concat(vehicles,house);
var result=sortbycost(concatobj);
console.log(result);


 // 4) lets say you have array of objects , find object which has "userId"==="INPUT_USERID"
 const devi={
  name:'devi',
  age:20,
  userid:21
};
const deva={
  name:'deva',
  age:21,
  userid:45
};
const mahesh={
  name:'mahesh',
  age:65,
  userid:75
};
const team=[devi,deva,mahesh];
R.filter(R.propEq('userid', 75), team);



//5) lets say you have array of objects (user details), new array value should have user details only whose completedTask >=50
const user1={name:'sridevi',age:20,TotalTasks:60,CompletedTasks:50,pending:10};
const user2={ name:'sravya',age:20,TotalTasks:40,CompletedTasks:30,pending:10};
const user3={name:'madhuri',age:21,TotalTasks:70,CompletedTasks:65,pending:5};
const user4={name:'navya',age:22,TotalTasks:45,CompletedTasks:43,pending:2};
const userdetails=[user1,user2,user3,user4];
var result=R.innerJoin(
(record,id)=>record.CompletedTasks>=id,
[user1,user2,user3,user4],[50]);
console.log(result);


//6) Take two arrays and find the common elements in both arrays (output should be array)
var array1=[1,2,3,4,5];
var array2=[2,1,2,3,5];
var result=R.intersection(array1,array2);
console.log(result);


//7) lets say you have arr1=[1,2,3,4,5,6] and arr2=[3,7,2,9,10,53] , all even element should be on left and old on right (into single array)

var arr1=[1,2,3,4,5,6] ;
var arr2=[3,7,2,9,10,53];
const iseven = n => n%2==0;
const isodd = n => n%2!=0;
const even=R.concat(R.filter(iseven,arr1),R.filter(iseven,arr2));
const odd=R.concat(R.filter(isodd,arr1),R.filter(isodd,arr2));
var Result=R.concat(even,odd);
console.log(Result);


//8) lets say you have array of objects (students marks details {name:'',marks:''.....}) , get the student details who have scored least in the class
var students=[
  {name:'sridevi',group:'A',marks:50,
  },
  {name:'devi',group:'A',marks:75},
  {name:'Ramu',group:'B',marks:45},
  {name:'radha',group:'B',marks:25 },
  { name:'Manoj',group:'C',marks:50} ];
const sortasc=R.sortBy(R.compose(R.prop('marks')));
R.take(1,sortasc(students));



//9) lets say you have array of objects drop last 5 players whose avg run scoring is less in overall batsmen
const players=[
  {name:'bumra',avgscore:32,rating:3.5},
  {name:'hardik',avgscore:55,rating:4},
  {name:'kohli',avgscore:45,rating:5},
  {name:'dhoni',avgscore:67,rating:4.5},
  {name:'ganesh',avgscore:77,rating:4},
  {name:'dilawar',avgscore:75,rating:4.3},
  {name:'singh',avgscore:80,rating:4.9}
];
const sortbyscores=R.sortBy(R.compose(R.prop('avgscore')));
R.take(5,sortbyscores(players));

