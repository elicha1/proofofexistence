/* proof ownership without revieling the actual file (the hash of the file an; the owner's name)/
/* proof that the file existed ( the hash of the file ; the block
timestamp) at specific time and proof the integrity( hash itself proves the file integrity) P.S:if the file was modified, then its hash will change and the contract won't be able to find any such file,therefore proving that the file was modified */
pragma Solidity ^0.4.2;

contract Proof{
      struct FileDetails{
            uint timestamp;
            string owner;
       }
      mapping(string=>FileDetails)files;
      event logFileAddedStatus(bool status, uint timestamp, string owner,string fleHash);
      function set( string owner, string fileHash){
                if (files[fileHash].timestamp==0){
                   files[fileHash]= FileDetails(block.timestamp,owner);
                   logFileAddedStatus(true,block.timestamp,owner,fileHash);
                }else{
                    logFileAddedStatus(false,block.timestamp,owner,fileHash);
                }
       }
       function get(string fileHash)returns(uint timestamp, string owner){
                return(files[fileHash].timestamp, files[fileHash].owner);
        }
}