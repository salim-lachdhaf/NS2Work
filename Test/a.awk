# End to End Delay   
# http://harrismare.net/2011/07/14/packet-delivery-ratio-packet-lost-end-to-end-delay/



BEGIN { 
   # simple awk script to generate end-to-end packet lifetime statistics 
   # in a form suitable for plotting with xgraph. 
   # Lloyd Wood, July 1999. 
   # http://www.ee.surrey.ac.uk/Personal/L.Wood/ns/ 

   highest_packet_id = 0; 
} 
	 
{ 
                 action = $1 
		time = $3 
		node_id = $5 
		flow_id = $39 
		packet_id = $41 
		pkt_size = $37 
		flow_t = $45 
		level = $19 

   if ( packet_id > highest_packet_id ) highest_packet_id = packet_id; 

   # getting start time is not a problem, provided you're not starting 
   # traffic at 0.0. 
   # could test for sending node_1_address or flow_id here. 
   if ( start_time[packet_id] == 0 )  start_time[packet_id] = time; 
   
   # only useful for small unicast where packet_id doesn't wrap. 
   # checking receive means avoiding recording drops 
   if ( action != "d" ) { 
      if ( action == "r" ) { 
	 # could test for receiving node_2_address or flow_id here. 
         end_time[packet_id] = time; 
      } 
   } else { 
      end_time[packet_id] = -1; 
   } 
}							  
END { 
    for ( packet_id = 0; packet_id <= highest_packet_id; packet_id++ ) { 
       start = start_time[packet_id]; 
       end = end_time[packet_id]; 
       packet_duration = end - start; 

       if ( start < end ) printf("%d %f\n", start, packet_duration); 
   } 
}
