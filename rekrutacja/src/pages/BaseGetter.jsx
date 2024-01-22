import React, { useEffect, useState } from 'react'

const BaseGetter = () => {
  const [fetched, setFetched] = useState([])

  useEffect(() => {
    const getEbooks = async () => {
      await fetch('http://127.0.0.1:8000/getall')
        .then(res=>res.json())
        .then(data=>{
          data.ebooks.forEach(item => {
            setFetched(prev => [...prev, item])
          })
        })
        .catch(() => {
          alert('No data in db')
        })
    }
    getEbooks()
  }, [])


  return (
    <div>
      <table style={{width: '100%'}}>
        <thead>
          <tr style={{border: '1px solid #000'}}>
            <th style={{border: '1px solid #000'}}>Name</th>
            <th style={{border: '1px solid #000'}}>Title</th>
            <th style={{border: '1px solid #000'}}>Curr</th>
            <th style={{border: '1px solid #000'}}>Price</th>
            <th style={{border: '1px solid #000'}}>Date</th>
            <th style={{border: '1px solid #000'}}>From NBP</th>
          </tr>
        </thead>
        <tbody>
        {fetched.map((item) => {
          return (
              <tr key={item.id} style={{border: '1px solid #000', textAlign: 'center'}}>
                <td key={item.name} style={{border: '1px solid #000', textAlign: 'center'}}>{item.name}</td>
                <td key={item.title} style={{border: '1px solid #000', textAlign: 'center'}}>{item.title}</td>
                <td key={item.curr} style={{border: '1px solid #000', textAlign: 'center'}}>{item.curr}</td>
                <td key={item.price} style={{border: '1px solid #000', textAlign: 'center'}}>{item.price}</td>    
                <td key={item.date} style={{border: '1px solid #000', textAlign: 'center'}}>{item.date}</td>    
                {item.fromNBP ? (
                  <td key={item.npb_data} style={{border: '1px solid #000'}}>
                    <ul key={item.fromNBP.id}>
                      <li>{item.fromNBP.rate}</li>
                      <li>{item.fromNBP.pricePLN}</li>
                      <li>{item.fromNBP.tableNo}</li>
                    </ul>
                  </td>  
                ) : (
                  <td key={item} style={{border: '1px solid #000'}}>
                    null
                  </td> 
                )}
              </tr>
            )
        })}
        </tbody>
      </table>
    </div>
  )
}

export default BaseGetter