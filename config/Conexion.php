<?php 
class Conexion {

	public static function concectar(){
		try{

			$cn = new PDO("mysql:host=localhost;dbname=scriptwebDB" , "root" , "");

			return $cn;


		} catch (Exception $ex){
			die($ex->getMessege());

		}
		

		
	}
}