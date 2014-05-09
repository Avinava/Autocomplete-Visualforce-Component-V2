/*
Copyright (c) 2013 avidev9@gmail.com
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. The name of the author may not be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, 
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
*    Author : avidev9@gmail.com
*    CreatedDate : 6-Oct-2013
*    Class Name : AutoCompleteV2_Con
**/
public class AutoCompleteV2_Con {

    public String labelFieldVar{ get; set; }
    public String valueFieldVar{ get; set; }
    public String sObjVal{get;set;}
    public Integer randomJsIden{get;set;}
    public Object cacheField{get;private set;} 
    
    private Object targetFieldVar;
    
    public AutoCompleteV2_Con(){
        randomJsIden = getRandomNumber(1000000);
        sObjVal='Account';
        labelFieldVar='Name';
        valueFieldVar='Id';
    }
    
    /*Dummy setter Method*/
    public void setCacheField(Object cacheField){}
    
    public void setTargetFieldVar(Object targetFieldVar){
        
        if(targetFieldVar != this.targetFieldVar){
            cacheField = getCacheFieldValue(targetFieldVar);
            this.targetFieldVar = targetFieldVar;
           
        }
        
    }
    
    public Object getTargetFieldVar(){
        return targetFieldVar;
    }
    
    private Object getCacheFieldValue(Object targetFieldVar){
        Object retVal = targetFieldVar;
        if(targetFieldVar!=null){
            for(sObject sObj : Database.query('SELECT '+valueFieldVar+','+labelFieldVar+' FROM '+sObjVal+' WHERE '+valueFieldVar+' =:targetFieldVar')){
                retVal = sObj.get(labelFieldVar);
                break;
            }
        }
        
        return retVal;
    }

    
    /*
    *Random number generator to change the js function name if multiple components us
    ***/
    private Integer getRandomNumber(Integer size){
        Double d = Math.random() * size;
        return d.intValue();
    }
    
    /*
    *This method queries data according to the passed parameters
    ***/
    @RemoteAction
    public static List<AutoCompleteData> getData(String sObjVal,String labelFieldVar,String valueFieldVar,String param){
       
        List<AutoCompleteData> AutoCompleteDatas = new List<AutoCompleteData>();
        param = String.escapeSingleQuotes(param);
        for( Sobject sObj : Database.query('SELECT '+valueFieldVar+','+labelFieldVar+' FROM '+sObjVal+' WHERE '+labelFieldVar+' LIKE \'%'+param+'%\'')){
            AutoCompleteDatas.add(new AutoCompleteData(sObj.get(valueFieldVar),sObj.get(labelFieldVar)));
        }
        
        return AutoCompleteDatas;
        
    }
    
    public class AutoCompleteData{
        public String id;
        public String text;
        
        public AutoCompleteData(Object id, Object text){
            this.id = String.valueOf(id);
            this.text = String.valueOf(text);
        }
    }

    
}