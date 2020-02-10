pragma solidity ^0.6.2;

contract placeDeMarche{
    
    struct Utilisateur{
        uint indice;
        uint reputation;
        string nom;
        
    }
    mapping (address=>Utilisateur) public listeUtilisateur;
    
    address[] utilisateurs;
    
    //inscrir un utilisateur
    function inscription (string memory nom,uint _experience)public{
        require(!estUtilisateur(msg.sender));
        uint indice=utilisateurs.length;
        uint reputation=experience(_experience);
        Utilisateur memory nouveauUtilisateur=Utilisateur(indice,reputation,nom);
        listeUtilisateur[msg.sender]=nouveauUtilisateur;
        utilisateurs.push(msg.sender);
    }

//pour donner une reputation en fonction de l'experience
    function experience(uint experience)internal pure returns(uint){
        uint exp;
        if(experience<2){
           exp=1;
        }else if(experience>=2 && experience<5){
            exp=3;
        }else if(experience>=5){
            exp=5;
        }
         return exp;
    }
    
//fonction pour véridier si c'est un utilisateurs
function estUtilisateur(address _adress)public view returns(bool){
    if(utilisateurs.length==0)return false;
    return(utilisateurs[listeUtilisateur[_adress].indice]==_adress);
}
   
  
}
