def test(x, **kwargs):
  print x
  reciever = kwargs
  print reciever

if __name__ == '__main__':
  test(x=1,y=2,z=3) # 1
                    # {y:2, z:3}
