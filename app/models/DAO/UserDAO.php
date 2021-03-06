<?php

require_once PATH_APP . "/models/DAO/DAO.php";
require_once PATH_APP . "/models/entitys/User.php";

class UserDAO extends DAO
{
  public function insert($UserObj)
  { 
    try {
      $sql = "INSERT INTO tb_user(tb_type_user_id, name, username, password) VALUES (1, :name, :username, :password)";
      $req = $this->PDO->prepare($sql);
      $req->bindValue(":name", $UserObj->getName());
      $req->bindValue(":username", $UserObj->getUsername());
      $req->bindValue(":password", $UserObj->getPassword());
      $req->execute();
      return true;

    } catch (Exception $error) {
      echo $error->getMessage();
    }

    return false;
  }
  public function update($UserObj)
  { }
  public function delete($id)
  { }
  public function query($id)
  { }
  public function queryAll()
  { }

  public function auth($username, $password)
  {
    try {
      $sql = "SELECT tb_user.id, tb_user.name FROM tb_user WHERE tb_user.username = :username AND tb_user.password = :password";
      $req = $this->PDO->prepare($sql);
      $req->bindValue(":username", $username);
      $req->bindValue(":password", $password);
      $req->execute();
      $result = $req->fetch();
      if(!empty($result)) {
        return $result;
      }
    } catch (Exception $error) {
      echo $error->getMessage();
    }

    return null;
  }
}
