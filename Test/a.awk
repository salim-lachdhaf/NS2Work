# AWK Script for Packet Delivery Calculation for OLD Trace Format

BEGIN {
	sent=0;
	received=0;

#variable de debit#
 	recvdSize = 0
       startTime = 1e6
       stopTime = 0
#fin debut variable#

#variable delais
	packet_duration =0; 
	NbConn=0;
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
             level = $19
       }
printf " Packet id:%d \n",pkt_id;

#Delivery Ratio#
  if(event=="s" && level=="AGT")
   {
    sent++;
   }
  else if(event=="r" && level=="AGT")
   {
     received++;
   }
#End Delivery Ratio

#DEBIT CALCUL

  # Store start time

  if (level == "AGT" && (event== "+" || event == "s") && pkt_size >=512) {
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
if ( pkt_id > highest_packet_id ) highest_packet_id = pkt_id; 

   # getting start time is not a problem, provided you're not starting 
   # traffic at 0.0. 
   # could test for sending node_1_address or flow_id here. 
   if ( start_time[pkt_id] == 0 )  start_time[pkt_id] = time; 
   
   # only useful for small unicast where packet_id doesn't wrap. 
   # checking receive means avoiding recording drops 
   if ( event != "d" ) { 
      if ( event == "r" ) { 
	 # could test for receiving node_2_address or flow_id here. 
         end_time[pkt_id] = time; 
      } 
   } else { 
      end_time[pkt_id] = -1; 
   } 
#end Delais
}
END{
 printf " Packet Sent:%d",sent;
 printf "\n Packet Received:%d",received;
 printf "\n Packet Delivery Ratio:%.2f%",(received/sent)*100;
 printf "\n Average Throughput[kbps] =%.2f\tStartTime=%.2f\tStopTime=%.2f",(recvdSize/(stopTime-startTime))*(8/1000),startTime,stopTime;

 for ( packet_id = 0; packet_id <= highest_packet_id; packet_id++ ) { 
       start = start_time[packet_id]; 
       end = end_time[packet_id]; 
       
       if ( start < end && end>0){
	 	packet_duration += end - start; 
		NbConn++;
	} 
   } 
 printf("\n EndToEnd: %.3f \n", (packet_duration/NbConn)); 

}
