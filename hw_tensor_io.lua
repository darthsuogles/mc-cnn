require 'io'
require 'torch'
require 'cutorch'

local fname = 'data.kitti/x0.bin'
local dim = torch.LongStorage {389, 1, 350, 1242}
local sz = 1
for i = 1, #dim do
   sz = sz * dim[i]
end
print (sz)
local binObj = torch.FloatStorage(fname, false, sz, false)
-- print(binObj, #binObj)
local x = torch.FloatTensor(binObj)
x = x:reshape(dim)
print(#x)
