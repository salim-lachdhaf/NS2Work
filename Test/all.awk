# AWK Script for Packet Delivery Calculation for OLD Trace Format

BEGIN {
	sent=0;
	received=0;
        deleted=0;

#variable de debit#
       recvdSize = 0
       startTime = 1e6
       stopTime = 0
#fin debut variable#

#variable delais
	packet_duration =0; 
	NbConn=0;
        highest_packet_id=0;
#end variable delais
}
{


# Trace line format: new

       if ($2 == "-t") {

             event = $1
             time = $3
             node_id = $5
             #flow_id = $39
             pkt_id = $41
             pkt_size = $37
             #flow_t = $45
             level = $19 #layer (packet type)
       }
       else{
	     event = $1
             time = $2
             node_id = $3
             pkt_id = $6
             pkt_size = $8
             level = $4 #layer (packet type)
            
	}

#Delivery Ratio#
  if(event=="s" && level=="AGT" && pkt_size >=512)
   {
    sent++;
   }
  else if(event=="r" && level=="AGT" && pkt_size >=512)
   {
     received++;
   }
   else if(event=="D" &&  pkt_size >=512)
   {
   		#if (time > stopTime) {
         #    stopTime = time
        #}
		#end_time[pkt_id] = time; 
        # if ( pkt_id > highest_packet_id ){
	 	 #	highest_packet_id = pkt_id;
         #}
     deleted++;
   }
#End Delivery Ratio

#DEBIT CALCUL

  # Store start time

  if (level == "AGT" &&  event == "s" && pkt_size >=512) {
    if (time < startTime) {
             startTime = time
             }
       }

  # Update total received packets' size and store packets arrival time
  if (level == "AGT" && event== "r" && pkt_size >= 512) {
       if (time > stopTime) {
             stopTime = time
             }
       # Rip off the header
       hdr_size = pkt_size % 512
       pkt_size -= hdr_size
       # Store received packet's size
       recvdSize += pkt_size
      }
#END DEBIT
 

#Begin delais

if ( event == "s" && level=="AGT") { 
         start_time[pkt_id] = time; 
         if ( pkt_id > highest_packet_id ){
	 	 	highest_packet_id = pkt_id;
         }
      } 
if ( event == "r" && level=="AGT") { 
         end_time[pkt_id] = time; 
         if ( pkt_id > highest_packet_id ){
	 	 	highest_packet_id = pkt_id;
         }
      } 
    
#end Delais
}
END{
 printf " Packet Sent:%d",sent;
 printf "\n Packet Received:%d",received;
 printf "\n Packet Deleted:%d",deleted;
 printf "\n Packet Deleted Ratio:%.2f %",((sent-received)/sent)*100;
 printf "\n Packet Delivery Ratio:%.2f%",(received/sent)*100;
 printf "\n Average Throughput[kbps] =%.2f\tStartTime=%.2f\tStopTime=%.2f",(recvdSize/(stopTime-startTime))*(8/1000),startTime,stopTime;

for ( packet_id = 0; packet_id <= highest_packet_id; packet_id++ ) { 
       start = start_time[packet_id]; 
       end = end_time[packet_id]; 
       if (start < end && end>0){
			packet_duration += end - start; 
			NbConn++;
	   } 
} 
 printf("\n EndToEnd: %.3f\n", (packet_duration/NbConn)); 

 
}
