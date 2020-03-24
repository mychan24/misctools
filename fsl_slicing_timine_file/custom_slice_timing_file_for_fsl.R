####
# Create custom slice-timing file for FSL slicetimer (slice timing correction)
# 

x <- jsonlite::fromJSON("*.json")

# unique() incase its multiband
b <- unique(sort(x$SliceTiming))
slice_time <- b[2]-b[1]
TR <- b[length(b)]+slice_time

st_correction <- round((x$SliceTiming-(TR/2))/TR,digits=3)

# The first slice should be shifted 'forward', thus a positive number, and the last slice should be shifted backward, a negative number
st_correction <- st_correction*-1 

write.table(st_correction, file="./slice_timing_for_fsl.txt", row.names = F, col.names = F)