<?php
class Product{
 
    // database connection and table name
    private $conn;
    private $table_name = "products";
 
    // object properties
    public $id;
    public $name;
    public $description;
    public $product_image;
    public $detail_image;
    public $price;
    public $buy_time;
    public $percent;
    public $update_time;
    public $created_time;
    public $status;
    public $user_mail;

    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // read old products
    function read(){
 
        // select all query
        $query = "SELECT * FROM products";
     
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // execute query
        $stmt->execute();
     
        return $stmt;
    }

    // create product
    function create(){
     
        // query to insert record
        $query = "INSERT INTO " . $this->table_name . " SET
                    name=:name, price=:price, description=:description, percent=:percent,product_image=:product_image,detail_image=:detail_image,user_mail=:user_mail,buy_time:=buy_time,status=:status, created_time=:created_time ,update_time:=update_time";
     
        // prepare query
        $stmt = $this->conn->prepare($query);
     
        // sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->price=htmlspecialchars(strip_tags($this->price));
        $this->description=htmlspecialchars(strip_tags($this->description));
        $this->percent=htmlspecialchars(strip_tags($this->percent));
        $this->product_image=htmlspecialchars(strip_tags($this->product_image));
        $this->detail_image=htmlspecialchars(strip_tags($this->detail_image));
        $this->user_mail=htmlspecialchars(strip_tags($this->user_mail));
        $this->buy_time=htmlspecialchars(strip_tags($this->buy_time));
        $this->status=htmlspecialchars(strip_tags($this->status));
        $this->created_time=htmlspecialchars(strip_tags($this->created_time));
        $this->update_time=htmlspecialchars(strip_tags($this->update_time));
     
        // bind values
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":price", $this->price);
        $stmt->bindParam(":description", $this->description);
        $stmt->bindParam(":percent", $this->percent);
        $stmt->bindParam(":product_image", $this->product_image);
        $stmt->bindParam(":detail_image", $this->detail_image);
        $stmt->bindParam(":user_mail", $this->user_mail);
        $stmt->bindParam(":buy_time", $this->buy_time);
        $stmt->bindParam(":status", $this->status);
        $stmt->bindParam(":created_time", $this->created_time);
        $stmt->bindParam(":update_time", $this->update_time);
     
        // execute query
        if($stmt->execute()){
            return true;
        }
     
        return false;
         
    }


    // used when filling up the update product form
    function readOne(){
     
        // query to read single record
        $query = "SELECT
                   *
                FROM
                    products p
                WHERE
                    p.id = ?
                LIMIT
                    0,1";
     
        // prepare query statement
        $stmt = $this->conn->prepare( $query );
     
        // bind id of product to be updated
        $stmt->bindParam(1, $this->id);
     
        // execute query
        $stmt->execute();
     
        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
     
        // set values to object properties
        $this->name=$row['name'];
        $this->price=$row['price'];
        $this->description=$row['description'];
        $this->percent=$row['percent'];
        $this->product_image=$row['product_image'];
        $this->detail_image=$row['detail_image'];
        $this->user_mail=$row['user_mail'];
        $this->buy_time=$row['buy_time'];
        $this->status=$row['status'];
        $this->created_time=$row['created_time'];
        $this->update_time=$row['update_time'];
    }



    // update the product
    function update(){
     
        // update query
        $query = "UPDATE
                    " . $this->table_name . "
                SET
                    name=:name, price=:price, description=:description, percent=:percent,product_image=:product_image,detail_image=:detail_image,user_mail=:user_mail,buy_time:=buy_time,status=:status, created_time=:created_time
                WHERE
                    id = :id";
     
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->price=htmlspecialchars(strip_tags($this->price));
        $this->description=htmlspecialchars(strip_tags($this->description));
        $this->percent=htmlspecialchars(strip_tags($this->percent));
        $this->product_image=htmlspecialchars(strip_tags($this->product_image));
        $this->detail_image=htmlspecialchars(strip_tags($this->detail_image));
        $this->user_mail=htmlspecialchars(strip_tags($this->user_mail));
        $this->buy_time=htmlspecialchars(strip_tags($this->buy_time));
        $this->status=htmlspecialchars(strip_tags($this->status));
        $this->created_time=htmlspecialchars(strip_tags($this->created_time));
        $this->update_time=htmlspecialchars(strip_tags($this->update_time));

        // bind values
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":price", $this->price);
        $stmt->bindParam(":description", $this->description);
        $stmt->bindParam(":percent", $this->percent);
        $stmt->bindParam(":product_image", $this->product_image);
        $stmt->bindParam(":detail_image", $this->detail_image);
        $stmt->bindParam(":user_mail", $this->user_mail);
        $stmt->bindParam(":buy_time", $this->buy_time);
        $stmt->bindParam(":status", $this->status);
        $stmt->bindParam(":created_time", $this->created_time);
        $stmt->bindParam(":update_time", $this->update_time);
     
        // execute the query
        if($stmt->execute()){
            return true;
        }
     
        return false;
    }


    // delete the product
    function delete(){
     
        // delete query
        $query = "DELETE FROM " . $this->table_name . " WHERE id = ?";
     
        // prepare query
        $stmt = $this->conn->prepare($query);
     
        // sanitize
        $this->id=htmlspecialchars(strip_tags($this->id));
     
        // bind id of record to delete
        $stmt->bindParam(1, $this->id);
     
        // execute query
        if($stmt->execute()){
            return true;
        }
     
        return false;
         
    }


    // search old products
    function search($keywords){
     
        // select all query
        $query = "SELECT
                   *
                FROM
                    " . $this->table_name . " p
                WHERE
                    p.name LIKE ? ";
     
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // sanitize
        $keywords=htmlspecialchars(strip_tags($keywords));
        $keywords = "%{$keywords}%";
     
        // bind
        $stmt->bindParam(1, $keywords);

        // execute query
        $stmt->execute();
     
        return $stmt;
    }


        // read old products with pagination
    public function readPaging($from_record_num, $records_per_page){
     
        // select query
        $query = "SELECT
                   *
                FROM  $this->table_name LIMIT ?, ?";
     
        // prepare query statement
        $stmt = $this->conn->prepare( $query );
     
        // bind variable values
        $stmt->bindParam(1, $from_record_num, PDO::PARAM_INT);
        $stmt->bindParam(2, $records_per_page, PDO::PARAM_INT);
     
        // execute query
        $stmt->execute();
     
        // return values from database
        return $stmt;
    }

    // used for paging old products
    public function count(){
        $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name . "";
     
        $stmt = $this->conn->prepare( $query );
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
     
        return $row['total_rows'];
    }
}