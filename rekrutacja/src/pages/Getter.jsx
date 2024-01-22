import React, { useState } from 'react'

const Getter = () => {
  const [singleSearch, setSingleSearch] = useState('')
  const [multiSearch, setMultiSearch] = useState('')
  const [fileSearch, setFileSearch] = useState('')
  const type = 'ebook'

  const handleSingleChange = (e) => {
    setSingleSearch(e.target.value);
  };

  const handleMultiChange = (e) => {
    setMultiSearch(e.target.value);
  };

  const handleFileChange = (e) => {
    setFileSearch(e.target.files[0]);
  };

  // const handleSingleSubmit = (e) => {
  //   e.preventDefault()
  //   const searchData = singleSearch.replaceAll("\"", "").split(",")
  //   let url = 'https://itunes.apple.com/search?term='
  //   searchData.forEach(x => {
  //     const sp = x.split(" ")
  //     sp.forEach(y => {
  //       url = url + y + "+"
  //     })
  //   })
  //   url = url.slice(0, -1) + "&media=" + type
  //   fetch(url)
  //     .then(res => res.json())
  //     .then(data => {
  //       const filtered = data.results.filter(item => item.trackName===searchData[1])
  //       filtered.forEach(result => {
  //         const oriDate = new Date(result.releaseDate)
  //         const obj = {
  //           name: result.artistName,
  //           title: result.trackName,
  //           curr: result.currency,
  //           price: result.price,
  //           date: oriDate.getFullYear()+"-"+oriDate.getMonth()+"-"+oriDate.getDay(),

  //         }
  //         console.log(obj)
  //       })
  //     })
  //     .catch(err => {
  //       console.log(err)
  //     })
  // }

  const handleSubmit = (e) => {
    e.preventDefault()
    const rows = multiSearch.replaceAll("\"", "").split('\n')
    rows.forEach((item) => {
      let appleUrl = 'https://itunes.apple.com/search?term='
      const searchData = item.split(",")
      searchData.forEach(value => {
        const words = value.split(" ")
        words.forEach(word => {
          appleUrl = appleUrl + word + "+"
        })
      })
      appleUrl = appleUrl.slice(0, -1) + "&media=" + type
      fetch(appleUrl)
        .then(res => res.json())
        .then(jsonRes => {
          const filtered = jsonRes.results.filter(x => x.trackName===searchData[1])
          if (filtered.length===0){
            console.log('No avaliable data under this url: ', appleUrl)
          }
          filtered.forEach(async result => {
            const oriDate = new Date(result.releaseDate)
            const releaseDate = oriDate.toISOString().split('T')[0]
            const moneyObj = await getMoneyObj(releaseDate, result.price, result.currency)
            const obj = {
              name: result.artistName,
              title: result.trackName,
              curr: result.currency,
              price: result.price,
              date: releaseDate,
              fromNBP: moneyObj,
            }
            fetch('http://127.0.0.1:8000/post',{
              method: 'POST',
              mode: 'cors',
              body: JSON.stringify(obj),
            })
            .then(res=>res.json())
            .then(fullRes => {
              console.log(fullRes)
            })
          })
        })
    })
  }

  const getMoneyObj = (date, price, curr) => {
    const tables = ['A', 'B', 'C'];
    let myValue
    for(let i = 0; i <= 2; i++){
      return fetch(`http://api.nbp.pl/api/exchangerates/rates/${tables[i]}/${curr}/${date}/`)
        .then(res=>{
          return res.json()
        })
        .then(data=>{
          myValue = {
            rate: data.rates[0].mid,
            pricePLN: price * data.rates[0].mid,
            tableNo: data.rates[0].no,
          }
          return myValue
        })
        .catch(()=> {
          return null
        })
    }
  }

  return (
    <div style={{display: 'flex', flexDirection:'row', justifyContent:'space-around'}}>

      {/* <form onSubmit={handleSingleSubmit} style={{display: 'flex', flexDirection:'column'}}>
        <label style={{display: 'flex', flexDirection:'column'}}>
          Find one record:
          <input type='text' value={singleSearch} onChange={handleSingleChange} />
        </label>
        <button type='submit'>Search</button>
      </form> */}

      <form style={{display: 'flex', flexDirection:'column'}} onSubmit={handleSubmit}>
        <label style={{display: 'flex', flexDirection:'column'}}>
          Find multiple recorde at once:
          <textarea type='text' style={{width: '600px', height: '200px'}} value={multiSearch} onChange={handleMultiChange} />
        </label>
        <button type='submit'>Search</button>
      </form>

      {/* <form style={{display: 'flex', flexDirection:'column'}}>
        <label style={{display: 'flex', flexDirection:'column'}}>
          Find from file:
          <input type='file' value={fileSearch} onChange={handleFileChange} />
        </label>
        <button type='submit'>Search</button>
      </form> */}
    </div>
  )
}

export default Getter