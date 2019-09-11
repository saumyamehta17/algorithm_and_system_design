class Elevator
	attr_accessor :label, :state, :current_floor, :request_arr, 
	              :capacity, :floors, :direction, :min, :max

	def initialize(floors, label)
		@floors = floors
		@request_arr = Array.new(floors, 0)
		@state = 'idle'
		@label = label
		@current_floor = 0
		@direction = 'up'
		@min = 0
		@max = 0
	end

	def valid?(floor)
		floor <= floors
	end	

	def start
		while(1)
			floor_num = gets.chomp.to_i
			if valid?(floor_num)
				if floor_num > max + 1
					max = floor_num-1
				end	
				if floor_num < min + 1
					min = floor_num - 1
				end	
				
				if min == max
					puts "I am at #{current_floor} #{request_arr.to_s}"
				end	
			else
				puts "Floor doesn't exist"
			end	
			sleep 1
		end	
	end		

	def add_req(floor_num)
		if floor_num > max + 1
			max = floor_num-1
		end	
		if floor_num < min + 1
			min = floor_num - 1
		end	
		@request_arr[floor_num-1] = 1
	end	

end	

class ElevatorController
	attr_accessor :elevators, :request_queue

	def initialize
		@elevators = []
		@request_queue = Queue.new
	end

	def add_elevator
		@elevators << Elevator.new(10, 'L1')
	end	

	def process
		while(!request_queue.empty?)
			floor = request_queue.deq
			@elevators[0].add_req(floor)
		end	
		puts @elevators[0].request_arr.to_s
	end	
end	

ec = ElevatorController.new
ec.add_elevator
ec.request_queue.enq(4)
ec.request_queue.enq(2)
ec.request_queue.enq(6)
ec.request_queue.enq(9)
ec.request_queue.enq(2)
ec.process
ec.elevators[0].start