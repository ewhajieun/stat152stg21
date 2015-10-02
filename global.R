myasian-function(r,sigma,s0,radio,k,t){
  r<-as.numeric(r)
  sigma<-as.numeric(sigma)
  s0<-as.numeric(s0)
  radio<-as.numeric(radio)
  k<-as.numeric(k)
  t<-as.numeric(t)
  
  delta.t<-1/250
  T<-round(t/delta.t)
  m<-1000
  c.t<-0
  p.t<-0
  sum.S<-0
  final<-0

  if(radio==1){            # ct 계산 
    for(i in 1:m){
      sum.S<-0
      for(j in 1:T){
        Z.j<-rnorm(1)
        if(j==1){
          S.j<-s0*exp((r-sigma^2/2)*delta.t+sigma*sqrt(delta.t)*Z.j)
        }else{
          S.j<-S.j*exp((r-sigma^2/2)*delta.t+sigma*sqrt(delta.t)*Z.j)
        }
        sum.S<-sum.S+S.j
      }
      s.bar<-sum.S/T
      if(s.bar-k>0){
        c.t<-c.t+exp(-r*t)*(s.bar-k)}
    }
    final<-c.t/m
  }else{
    for(i in 1:m){
      sum.S<-0
      for(j in 1:T){
        Z.j<-rnorm(1)
        if(j==1){
          S.j<-s0*exp((r-sigma^2/2)*delta.t+sigma*sqrt(delta.t)*Z.j)
        }else{
          S.j<-S.j*exp((r-sigma^2/2)*delta.t+sigma*sqrt(delta.t)*Z.j)
        }
        sum.S<-sum.S+S.j
      }
      s.bar<-sum.S/T
      if(s.bar-k>0){
        c.t<-c.t+exp(-r*t)*(s.bar-k)}else{
          p.t<-p.t+exp(-r*t)*(k-s.bar)}
    }
    final<-p.t/m
  }
  
  return(as.numeric(final))}

