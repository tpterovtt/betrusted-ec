	lui  a1, 0x2001B   		# form address 0x2001_B000: a1 is source
	lui  a2, 0x10000		# form address 0x1000_0000: a2 is dest
 	lui  a3, 0x1000C	        # end copy,0x1000_C000 (48kiB): a3
loop:
	lw   a4, 0(a1)			# copy source to temp
	sw   a4, 0(a2)                  # store in dest
	addi a1, a1, 0x4                # increment source
	addi a2, a2, 0x4                # increment dest
	bne  a2, a3, loop               # repeat if end address not hit

	lui  a2, 0x10000	        # re-form address 0x1000_0000
	jalr x0, a2, 0			# jump to head of SRAM

